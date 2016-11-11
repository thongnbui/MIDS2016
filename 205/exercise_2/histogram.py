import argparse
import psycopg2


parser = argparse.ArgumentParser(description='histogram')
parser.add_argument('range_values', help='range values (ex: [3,8])')
args = parser.parse_args()

values = args.range_values.split(",")
conn = psycopg2.connect(database="tcount", user="postgres", host="localhost", port="5432")
cur = conn.cursor()

cur.execute("SELECT word, count from Tweetwordcount where count >= %s and count <= %s order by 2,1", (values[0],values[1]))
records = cur.fetchall()

for rec in records:
    print('\t%s: %s' % (rec[0],rec[1]))

conn.close()
