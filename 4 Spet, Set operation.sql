-- set operation 
-- Set operations allow you to combine the results of two or more SELECT queries into a single result set.
-- They work like mathematical sets (Union, Intersection, Difference). 
use sakila ;
select * from actor where actor_id between 1 and 3 
union 
select * from actor where actor_id between 3 and 5 ;

select * from actor where actor_id between 1 and 3 
union all 
select * from actor where actor_id between 3 and 5 ;

-- common in both table 
select * from actor where actor_id between 1 and 3 
intersect 
select * from actor where actor_id between 3 and 5 ;

-- table 1  have that is not in table 2 
select * from actor where actor_id between 1 and 3 
except
select * from actor where actor_id between 3 and 5 ;


-- recursive cte is a feature which we use in cte again and again based on the condtion until it is matched 
-- it is used to find out with the help hirerachial or tree like order
-- eg => like if a employee want to find out the boss of her then we use rcte . 

with recursive cte as
(select 1 as num
union
select num+1 from cte where num<6
)
select * from cte ;


with recursive cte as
(select 1 num  , 1 as x 
union
select num+1 , x*(num+1) from cte where num<6
)
select * from cte ;



use regex1;
drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

 select * from employees ;
 
 with recursive  cte as 
 (select employee_id ,name , manager_id, 1 as levels
 from employees as e where manager_id is null
 union 
 select etemp.employee_id , etemp.name , etemp.manager_id , levels+1
 from employees as etemp join cte  where etemp.manager_id = cte.employee_id )
 select * from cte ;