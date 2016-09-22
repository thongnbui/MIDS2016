# From my local machine, I rename the csv files
mv Hospital\ General\ Information.csv hospitals.csv
mv Timely\ and\ Effective\ Care\ -\ Hospital.csv effective_care.csv
mv Readmissions\ and\ Deaths\ -\ Hospital.csv readmissions.csv
mv Measure\ Dates.csv measures.csv
mv Out*Procedu* procedures.csv
mv hvbp_hcahps_05_28_2015.csv surveys_responses.csv

# From my AWS machine, as w205 user, I created a new directory /home/w205/hospital_compare
# Then, from my local machine, I  push them to my new AWS machine

scp  -i "/Users/thongbui/Desktop/MIDS/205_storage_retrieval/ucb4.pem" effective_care.csv root@ec2-54-172-195-106.compute-1.amazonaws.com:/home/w205/hospital_compare/ 
scp  -i "/Users/thongbui/Desktop/MIDS/205_storage_retrieval/ucb4.pem" hospitals.csv root@ec2-54-172-195-106.compute-1.amazonaws.com:/home/w205/hospital_compare/ 
scp  -i "/Users/thongbui/Desktop/MIDS/205_storage_retrieval/ucb4.pem" measures.csv root@ec2-54-172-195-106.compute-1.amazonaws.com:/home/w205/hospital_compare/ 
scp  -i "/Users/thongbui/Desktop/MIDS/205_storage_retrieval/ucb4.pem" readmissions.csv root@ec2-54-172-195-106.compute-1.amazonaws.com:/home/w205/hospital_compare/ 
scp  -i "/Users/thongbui/Desktop/MIDS/205_storage_retrieval/ucb4.pem" surveys_responses.csv root@ec2-54-172-195-106.compute-1.amazonaws.com:/home/w205/hospital_compare/ 

