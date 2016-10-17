create table hospital_variability
as
select * from hospital_aggr_var_score
order by variability desc
limit 10;

select * from hospital_variability;