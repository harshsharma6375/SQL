use sakila ;
select * from payment ;
-- any => greater than the minimum value of subquery . 
select payment_id, customer_id,amount from payment 
where amount <= any (select amount from payment where payment_id = 2 or payment_id = 3 or payment_id = 5);
-- < = 0.99 , < = 5.99 , < = 9.99 


-- smaller value
select payment_id, customer_id,amount from payment 
where amount < all (select amount from payment where payment_id = 2 or payment_id = 3 or payment_id = 5);
-- < = 0.99 , < = 5.99 , < = 9.99 


-- greater value 
select payment_id, customer_id,amount from payment 
where amount > all (select amount from payment where payment_id = 2 or payment_id = 3 or payment_id = 5);
-- < = 0.99 , < = 5.99 , < = 9.99 

 
-- get the name of the country whose population is bigger than all the population of the country from the contenint of north america . 
use world;
select * from country;
select  population from country 
where population > all (select population from world.country where continent = 'north america');


-- get the country code the name of the country whose lifeexpectancy is same as for the countries from europe . 
select name, continent from world.country;
-- get the name and the continent for the countries who have got the independence near by the independence year of the countries from asia . 
select * from world.country ;
select name, continent from world.country
where Indepyear > any(select IndepYear from world.country where continent = 'europe') ;


select continent , count(*) from world.country
where Indepyear > any(select IndepYear from world.country where continent = 'asia') 
and continent != 'asia'
group by continent ;



-- order by clause 

select * from world.country order by name ;
-- sorting based on region and surface area 
select * from world.country order by region , SurfaceArea;

select * from world.country order by region desc, SurfaceArea; 

-- subquery 
select name , population,(select population from world.country where name = "anguilla") from world.country;