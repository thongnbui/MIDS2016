import argparse
import psycopg2


parser = argparse.ArgumentParser(description='query final results')
parser.add_argument('input_word', nargs="?", help='input word to retrieve')
args = parser.parse_args()

conn = psycopg2.connect(database="tcount", user="postgres", host="localhost", port="5432")
cur = conn.cursor()

print("Input = %s" % args.input_word)
if (args.input_word == None):
    cur.execute("SELECT word, count from Tweetwordcount order by word")
    records = cur.fetchall()
    print(records)

else:
    cur.execute("SELECT word, count from Tweetwordcount where word = %s", (args.input_word,))
    records = cur.fetchall()
    if (records == []):
        print("No row found")

    for rec in records:
        print('Total number of occurences of "%s": %s' % (rec[0],rec[1]))


conn.close()
