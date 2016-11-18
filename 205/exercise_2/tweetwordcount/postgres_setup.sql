-- Create DB if it doesn't exist
create database tcount;

\c tcount

-- Create table if it doesn't exist
CREATE TABLE tweetwordcount(word varchar(100), count integer);
truncate table tweetwordcount;