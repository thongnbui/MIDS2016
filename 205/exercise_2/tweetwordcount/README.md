To run this application, first, make sure the Postgres DB is up and running by trying to log into the DB:
   psql -U postgres

Make sure the database tcount is already created:
\c tcount

And the table tweetwordcount exists:

select count(*) from tweetwordcount;

To exit DB: \q

If the DB is not up and running, you can start it by running: /data/start_postgres.sh
And create the database tcount and table tweetwordcount in tcount

Now, you can run the Storm application. From this directory (tweetwordcount), run:
   sparse run


Once it's start running, you will see lots of message like shown in exercise_2/screenshots/screenshot-twitterStream.png
