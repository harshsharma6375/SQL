-- subquery => query within a query also known as nested query and inner query . 
-- query (subquery)

-- hardcore 

use world ;
select population from city where name = 'kabul';
select name,population from city where population > 1780000;

-- sub query 

 select name,population from city where population > (select population from city where name = 'kabul');
 
 -- now get the name of the city where the distrcit is same as of the district for amsterdam
 -- name of the city 
 -- district ki value same 
 -- district same as amsterdam 
 
 select * from city ;
 
 select district from city where name  = 'amsterdam';
 select name , district from city where district = 'Noord-holland' ;
 
 
  select name , district from city where district = ( select district from city where name  = 'amsterdam');


-- country table question
-- get the country code and the country name where the continent matches the contenint of the country albania
-- get the contenint the name of the country where the life expentance matches is with the life expentance of the country name is cook islands . 
-- get the country code and the contenint and gnp value for the countries where the region does not match with the region of the country name as benin . 




-- Q1 )
-- get the country code  and country name 
-- conteninet matches = contenint of the country albania 

select * from country ;
select code , name from country  where continent  =  (select continent from country where name = 'albania') ;

-- Q2 ) 
select name from country where lifeexpectancy  = (select lifeexpectancy from country where name = 'cook islands' ) ;

-- Q3)
select code ,continent , gnp from country where region != (select region from country where name = 'benin');


-- there are 3 types pf subquery . 
-- single row subquery
-- multi row subquery 

-- i need to get the country name and the population for all the countries avaiblae in the continent name as europe . 
-- in single row sub query we cant use arithmetic operator . 


select name , population , continent from country where name in (select  name  from country where continent= 'europe');

-- multi row subquery (in  

-- i need to get the country name and the country code where the lifeexpectancy match with the lifeexpectancy of the country name as bahamas . 
select * from country ;
select name , code , lifeexpectancy from  country where name in (select name form country where lifeexpecatncy = 'bahamas');
select LifeExpectancy,name from country where LifeExpectancy =( select LifeExpectancy from country where name="bahamas");