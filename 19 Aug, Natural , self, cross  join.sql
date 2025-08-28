use sakila ;
select * from actor;
select * from film_actor;


select a.actor_id , a.first_name from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id;

-- natural join it works when we have a same column name 
-- natural join is a kind of join which is worst join because the tables have common join then it works as an inner join otherwise it works as a cross join . 
select a.actor_id , a.first_name, fa. from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id;


-- cross join is a kind of join which is also known as cartesian join 

-- inner join  -> on, where , using , where jab likhte hai jab hum inner likhte hai 
-- table join table 2 where clause 

select a.actor_id , a.first_name , fa.film_id from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id;


select a.actor_id , a.first_name , fa.film_id from actor as a 
inner join film_actor as fa on  a.actor_id = fa.actor_id;

select a.actor_id , a.first_name , fa.film_id from actor as a 
inner join film_actor as fa using (actor_id);

-- counting of film actors movie 
-- join in 2 tables 
select * from film_Actor;
select a.first_name , count(fa.film_id) from actor as a 
join film_actor as fa where a.actor_id = fa.actor_id
group by a.first_name;

-- join in 3 tables 
select * from actor;
select * from film_actor;
select * from film;

select act.actor_id,act.first_name  from actor as act
join film_actor as factor 

	where act.actor_id = factor.actor_id ;

select act.actor_id,act.first_name , factor.film_id , film.title from actor as act
join film_actor as factor 
	join film 
	where act.actor_id = factor.actor_id and factor.film_id = film.film_id;
    
    

use world ;
select * from city ;
-- get the city name and district where the district do not have a worf 'noord' . 

select name  as cityn, District 
from city 
where district not like '%noord%';


-- get thwe total no. of cities presnt in each country having the population gretaer than 1.5 lakh .

use world ;
select * from city;
select countrycode
from city 
where population > 150000
group by countrycode;

-- get the district name which has more than two cities . 


select district , count(*) as totalcities
from city
group by district 
having count(*)> 2 ;



-- find the city name , the country code and country name where the country population > 50000 . 
SELECT Name AS City_Name, CountryCode, Population
FROM city
WHERE Population > 50000
ORDER BY CountryCode, Population DESC;

USE world;


SELECT city.Name AS City_Name, city.CountryCode, country.Name AS Country_Name
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Population > 50000;

-- get the district and the population for each country
SELECT country.Name AS Country_Name, city.District, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY Country_Name, District;
