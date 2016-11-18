from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
       

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        #Define our connection string
        conn_string = "host='localhost' dbname='tcount' user='postgres'"# password='secret'"
        #conn_string = "host='localhost' dbname='my_database' user='postgres' password='secret'"
 
        # print the connection string we will use to connect
        self.log("Connecting to database\n->%s" % (conn_string))
 
        # get a connection, if a connect cannot be made an exception will be raised here
        conn = psycopg2.connect(conn_string)
 
        # conn.cursor will return a cursor object, you can use this cursor to perform queries
        cursor = conn.cursor()
        self.log("Connected! Now trying to query....")
 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        ################# For now, just count the rows

        # Increment the local count
        self.counts[word] += 1
        if (self.counts[word] == 1):
            self.log("********Inserting postgres(%s, %s)" % (word,self.counts[word]))
            cursor.execute("INSERT INTO Tweetwordcount (word,count) VALUES (%s, %s)", (word,self.counts[word]))
        else:
            self.log("*********Updating postgress: (%s, %s)" %  (word,self.counts[word]))
            cursor.execute("Update Tweetwordcount set count = %s where word = %s", (self.counts[word], word))

        conn.commit()
        conn.close()


        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
