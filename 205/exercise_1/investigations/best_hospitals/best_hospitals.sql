drop table hospital_score;
create table hospital_score as
select h.providerId, h.HospitalName, state, cast(score as int) score
from hospital h, effective_care2 e
where h.providerId = e.providerId;

drop table hospital_aggr_score;
create table hospital_aggr_score as
select providerId, hospitalName, sum(score) total_score, avg(score) avg_score
from hospital_score
group by providerId, hospitalName;

drop table hospital_aggr_var_score;
create table hospital_aggr_var_score as
select h1.providerId, h1.hospitalName, total_score, avg_score, avg(power(score - avg_score,2)) variability 
from hospital_aggr_score h1, hospital_score h2
where h1.providerId = h2.providerId
group by h1.providerId, h1.hospitalName, total_score, avg_score;

drop table best_hospital;
create table best_hospital as
select * from hospital_aggr_var_score
order by avg_score desc
limit 10;

select * from best_hospital;
