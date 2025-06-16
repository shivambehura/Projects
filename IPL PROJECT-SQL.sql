use ipl;
desc deliveries;
desc matches;
select * from deliveries;
select * from matches;
select count(*) from deliveries; # jis taraf when aagaya bdha rahega
select count(*) from matches;  # jaha bhi pri key hoga vaha ka rows kam hogaa
select player_of_match from matches
where id=1; 
select count(id) from matches
where city ="Delhi" and toss_decison="bat";

select count(id) from matches
where city="Delhi" and toss_decision="bat"; # select those id whose

select distinct city from matches;

select distinct city from matches
where city like  "%u%";

select distinct city from matches
where city like  "%U_";                   #2nd last

select substr("rising pune supergiant",8,4) as city;                                  # (7,4)

select replace("rising pune supergiant","pune","andheri")as andh;   

select avg(win_by_runs),min(win_by_runs),max(win_by_runs) from matches;

select * from matches
where win_by_runs=146; 

select * from matches
where win_by_runs=(select max(win_by_runs)from matches);

select * from matches
where win_by_runs=(select max(win_by_runs) from matches);      #by sub query

select count(coalesce(umpire3)) from matches;

select * from matches
where umpire3 is not null;  #it will select all and find u out which is not null

select avg(win_by_runs),min(win_by_runs),max(win_by_runs) from matches;

select count(*) from matches where win_by_runs=14;
  
select count(*) from matches where win_by_runs<14;
select count(*) from matches where win_by_runs>14;

select win_by_runs,
case when win_by_runs=14 then "won by average" #equal to ni aayega thats why we write >0
when win_by_runs<14 then "won below average"
when win_by_runs>14 then "won above average"
else "None"
from matches;

select id,win_by_runs,                             #case using 
case
when win_by_runs>14 then "won above average"
when win_by_runs<14 then "won by average"
when win_by_runs>0 then"won below average"
else "tie"
end as result
from matches;

select player_of_match,id
from matches
group by player_of_match
order by player_of_match desc
limit 5;

select player_of_match,count(*) awards_count
from matches
group by player_of_match
order by awards_count desc
limit 5;

#how many matches are won by each team in each season

select season,winner,count(*) RESULT
from matches
group by season,winner;

# PROJECT DONE 


























