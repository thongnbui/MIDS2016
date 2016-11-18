This exercise 2 contains:
1) the main Storm application tweetwordcount that counts the words from Twitter and stores result in local Postgres table. Here are the steps:
   - clone the repo:
   git clone https://github.com/thongnbui/MIDS2016

   cd MIDS2016/205/exercise_2/tweetwordcount/
   ./run.sh

   Once it's start running, you will see lots of message like shown in exercise_2/screenshots/screenshot-twitterStream.png

   Ctrl^C when you want to stop it.

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
