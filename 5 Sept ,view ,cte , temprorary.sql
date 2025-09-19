-- view (virtual table ) 
-- table data store physically 
-- views are the virtual table that stores the query so that this particular query  we can reuse this 
-- just to give the security .


 use sakila ;
 select * from actor;

 create view t1 as(
 select first_name , count(*) from actor
where actor_id > 10 group by first_name order by count(*) desc);

select * from t1;

select *  from temp ;
create view temp2  as (select first_name , last_name from actor);
 select * from temp2;
 
 
 
 -- ctas (create table as select )
 -- used to create a new table from the result of a query 
 create table factor as 
 (select actor_id , first_name , last_name from actor where actor_id < 7);
 
 select * from factor;
 
 -- make a view from all column in view do update and insert query and check the changes seen in original 

 
 select * from actor ;
 create view temp3 as (select * from actor);
 select * from temp3;
 INSERT INTO temp3 (actor_id, actor_name)
VALUES (6, 'Shahrukh Khan');

update temp3  set actor_id = 5 where actor_id = 1 ;

 -- make a view actorid , first name do insert in this and check it is happen or not . 

CREATE VIEW temp4 AS
SELECT actor_id, first_name
FROM actor
WHERE actor_id < 10;

INSERT INTO temp4 (actor_id, first_name, last_name, last_update)
VALUES (2, 'Harsh', 'Sharma', NOW());

INSERT INTO temp4 (actor_id, first_name) VALUES (2, 'Harsh');

select * from temp4;
-- temprorary table are accessible from anywhere 
-- they are for the session not after switch off the workbench . 
-- what is difference btw cte , views and temproray table . 

create temporary table xyz as 
(select actor_id , first_name , last_name from actor where actor_id < 7);


-- cte (Common Table Expression) -> A CTE is a temporary result set defined within a query using the WITH keyword. 
with cte as 
(select actor_id ,
 first_name , last_name from actor where actor_id < 7)
select * from cte ;

use sakila ;
select * from xyz;
select * from actor ;
