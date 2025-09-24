-- TCL 

-- group  by , joins , cte , subquery , windows function , dml , ddl 
-- tcl 
-- transactiom control language 
-- transaction : set of logical statment consisient
-- transaction (start / stop -end 
-- normalization / alter

select @@autocommit;
use regex1;
show tables;
select * from courses1;
insert into courses1 values(12 , "science");
select * from courses1;

set @@autocommit = 0;
insert into courses1 values(13 , "maths");
select * from courses1;

/*
Transaction start :
start transaction (statment)
or 
autocommit is disable 

dml operation (this operation will be temproray when transaction start) 

transaction stop :
commit , rollback 
ddl statment - drop , update , truncate , alter 
dcl statment - 


*/

select @@autocommit;
insert into courses1 values(15 , "kamal");
select * from courses1;
update courses1 set cname = "regex";

select * from courses1;
rollback;

insert into courses1 values(15 , "kamal");
select * from courses1;
commit; -- after commit rollback doesnt make any changes because it works only in pending state 
rollback;


select @@autocommit ;
set @@autocommit = 1 ;
start transaction ; -- set of logical statement 
insert into courses1 values (16 , "c**" );
create table tushar124(id int); -- ddl (statment) transaction is saved 
select * from courses1;
show tables;


-- SAVE POINT
start transaction ; 
insert into courses1 values (17 , "ab" );
insert into courses1 values (18 , "bd" );
savepoint courses_insert ;
select * from courses1;
update courses1 set cname = "ram" where course_id = 15 ;
rollback to courses_insert ;
select * from courses1;


-- DCL (Data Control Language ) 
-- Authentication 
-- Authorization 

select * from mysql.user;
create user harsh    identified by "6375";

create database  ecommerce ;
use ecommerce ;
create table customer(id int, cname varchar (20)) ;
insert into customer values(1 , 'anil') , (2,'ram');

select * from customer;
grant all privileges on ecommerce.* to harsh ;
grant select on ecommerce.* to harsh ;
show grants for harsh;

revoke all privileges on ecommerce.* from harsh ;


-- ASSIGNMENT 
-- object ownership -> it means if we gave this permission to user then it has all permissions of the database . 
-- It is not supported in mysql to carry ownership from one to another but in oracle . 

-- yash user ko select privilege deni hai on a specific column
-- give select and update privileges to user 
-- gropu (role) name as sales in the role add to user yash and aditya give the select and insert privileges to the role and assign this particular role to your table.