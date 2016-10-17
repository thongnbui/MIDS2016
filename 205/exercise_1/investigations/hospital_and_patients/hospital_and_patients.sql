drop table hospital_patient_score;
create table hospital_patient_score as
select h.providerId, hospitalName,  hcahpsbasescore+hcahpsconsistencyscore patient_score
from hospital h, survey_response2 s
where h.providerid = s.providerid
order by patient_score desc
limit 10;

select * from hospital_patient_score;

