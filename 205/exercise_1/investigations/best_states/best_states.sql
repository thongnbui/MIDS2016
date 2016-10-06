drop table best_state;
create table best_state as 
select state, sum(score) total_score, avg(score) avg_score
from hospital_score h 
group by state
order by avg_score desc
limit 10;

select * from best_state;