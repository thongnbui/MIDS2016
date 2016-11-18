This directory contains:
1) the main Storm application tweetwordcount that counts the words from Twitter and stores result in local Postgres table 

   Before running this application, make sure the Postgres DB is up and running by trying to log into the DB:

   	  psql -U postgres

   Make sure the database tcount is already created:
   	\c tcount

   And the table tweetwordcount exists:

       select count(*) from tweetwordcount;

       To exit DB: \q

       If the DB is not up and running, you can start it by running: /data/start_postgres.sh
       And create the database tcount and table tweetwordcount in tcount

   Now, you can run the Storm application:

   - cd tweetwordcount
   - sparse run

   Once it's start running, you will see lots of message like shown in exercise_2/screenshots/screenshot-twitterStream.png

2) tools to check the results after tweetwordcount was run:
   - finalresults.py: this application reads data from Postgres to either returns the total number of word occurrences or all the words 
     and their occurrences

   Ex1: 		      	   	       
   $ python finalresults.py hello
   $ Total number of occurences of “hello”: 10 
   Ex2:	       	  	     
   $ python finalresults.py
   $ (<word1>, 2), (<word2>, 8), (<word3>, 6), (<word4>, 1), ... 

   - histogram.py: given 2 integers, this script will return all the words with occurences in this range
   Ex: python histogram.py 1,8
