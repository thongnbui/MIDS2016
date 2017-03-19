/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// scalastyle:off println
package org.apache.spark.examples.streaming

import org.apache.spark.streaming.{Seconds, StreamingContext}
import org.apache.spark.SparkContext._
import org.apache.spark.streaming.twitter._
import org.apache.spark.SparkConf

/**
 * Calculates popular hashtags (topics) over sliding 10 and 60 second windows from a Twitter
 * stream. The stream is instantiated with credentials and optionally filters supplied by the
 * command line arguments.
 *
 * Run this on your local machine as
 *
 */
object TwitterPopularTags {
  def getAllUsers(author: String, tweetMsg: String) : collection.mutable.Set[String] = {
     val words = tweetMsg.split(" ")
     var users = collection.mutable.Set[String](author)
     for (w <- words) {
         if (w.startsWith("@")) {
            users += w.substring(1)
         }
     }
     return users
  }

  def main(args: Array[String]) {
    if (args.length < 4) {
      System.err.println("Usage: TwitterPopularTags <consumer key> <consumer secret> " +
        "<access token> <access token secret> <minutes1> <minutes2> [<filters>]")
      System.exit(1)
    }

//    StreamingExamples.setStreamingLogLevels()

    val Array(consumerKey, consumerSecret, accessToken, accessTokenSecret, mins1, mins2) = args.take(6)
    val filters = args.takeRight(args.length - 6)
    val short_seconds = 60 * mins1.toInt
    val long_seconds = 60* mins2.toInt
    val totalRuntime_s = 3

    // Set the system properties so that Twitter4j library used by twitter stream
    // can use them to generat OAuth credentials
    System.setProperty("twitter4j.oauth.consumerKey", consumerKey)
    System.setProperty("twitter4j.oauth.consumerSecret", consumerSecret)
    System.setProperty("twitter4j.oauth.accessToken", accessToken)
    System.setProperty("twitter4j.oauth.accessTokenSecret", accessTokenSecret)

    val sparkConf = new SparkConf().setAppName("TwitterPopularTags")
    val ssc = new StreamingContext(sparkConf, Seconds(short_seconds))
    val stream = TwitterUtils.createStream(ssc, None, filters)

    val hashTags = stream.flatMap(status => status.getText.split("\\s+").filter(_.startsWith("#"))
    		 .map(hashtag => HashTagUser(hashtag, getAllUsers(status.getUser.getScreenName, status.getText))))

//    val tweetData = stream.map(status => TweetData(status.getUser.getScreenName, status.getText.trim))
//    val hashTags = tweetData.flatMap(tweet => tweet.message.split(" ").filter(_.startsWith("#"))
 //   	       			       	  .map(hashtag => HashTagUser(hashtag, tweet.user)))


//    hashTags.print()

//    val hashTagGroups = hashTags.groupByKey()
//    hashTagGroups.print()

    // short period: Top count on hashTag only
    val topCounts1 = hashTags.map(hashTag => hashTag.hashTag).map((_, 1)).reduceByKeyAndWindow(_ + _, Seconds(short_seconds))
                     .map{case (topic, count) => (count, topic)}
                     .transform(_.sortByKey(false))
    val topCounts2 = hashTags.map(hashTag => hashTag.hashTag).map((_, 1)).reduceByKeyAndWindow(_ + _, Seconds(long_seconds))
                     .map{case (topic, count) => (count, topic)}
                     .transform(_.sortByKey(false))

    // Here I am building the map for tags -> users to be used later
    var tagMaps = collection.mutable.Map[String, collection.mutable.Set[String]]()
    hashTags.foreachRDD(rdd => {
        for(item <- rdd.collect()) {
//	    println("item = " + item)
            val optUsers = tagMaps.get(item.hashTag)
//	    println("Processing " + item.hashTag + ":" + item.user)
	    if (optUsers == None) {
	       tagMaps.put(item.hashTag, item.user)
	    }
	    else {
	        var users = optUsers.get
	    	users = users ++ item.user
            	tagMaps.put(item.hashTag,users)
	    }
//	    println(item.hashTag + " -> " + tagMaps.get(item.hashTag))
	}
    })

//    println("tagMaps.keys: " + tagMaps.keys)
//    println("tagMaps.values: " + tagMaps.values)

    // Print popular hashtags for short period
    topCounts1.foreachRDD(rdd => {
      val topList = rdd.take(10)
      println("********************************************")
      println("Top 10 hashtags in last %s mins (%s total):".format(short_seconds/60, rdd.count()))
      topList.foreach{case (count, tag) => if (tag != Nil) println("%s : count = %s, users = %s".format(tag, count, tagMaps.get(tag).mkString(",")))}
    })

    topCounts2.foreachRDD(rdd => {
      val topList = rdd.take(10)
      println("*****************************************************************************************************")
      println("Top 10 hashtags in last %s mins (%s total):".format(long_seconds/60, rdd.count()))
      topList.foreach{case (count, tag) => if (tag != Nil) println("%s : count = %s, users = %s".format(tag, count, tagMaps.get(tag).mkString(",")))}
    })

    ssc.start()
    ssc.awaitTerminationOrTimeout(totalRuntime_s) // * 1000)
    ssc.awaitTermination()
  }
}
// scalastyle:on println
//case class TweetData(user: String, message: String)
case class HashTagUser(hashTag: String, user: collection.mutable.Set[String])
