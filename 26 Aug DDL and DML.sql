-- table creation (DDL) , (DML)

use sakila ;
-- table = object 
-- int, float , double , string [varchar , char]
create table studentAccess(id int , sname varchar(10));
insert into studentAccess values (9,'abc'); 
-- dml (it used to insert data in table)
-- ddl (it is used to make the changes in the table) 

-- problem 
-- that we have to give the whole column values 
insert into studentAccess values (9,'abc'); 

-- solution method 2
insert into studentAccess(id) values(22);
insert into studentAccess(sname) values("yash");
select * from studentAccess;

drop table studentaccess;  -- ddl 
create table studentaccess(id int , sname varchar(10) , age int);
select * from studentaccess;

insert into studentAccess(id) values(22);
insert into studentAccess(sname) values("yash");
select * from studentAccess;

-- dml(update)
-- all rows are updated 
update  studentaccess set sname = 'raj';
select * from studentaccess;
-- 1 row with the where clause 
update  studentaccess set sname = 'abhishek' where id = 22;

drop table studentaccess;
create table studentaccess(id int , sname varchar(10) );
insert into studentAccess(id , sname) values(21 , "yash");
-- delete(dml)
insert into studentAccess(id , sname) values(23 , "naina");
select * from studentaccess;
delete from studentaccess;
delete from studentaccess where id between 20 and 22 ;

-- merge is a dml statment (not used in mysql )
-- syntax same as CASE 
-- MERGE * TABLE USING REFERNCE TABLE WHERE CONDITON THEN STATMENT ;
/* CASE
     WHEN CONDITION THEN EXPRESSION
       
 */    
-- TRUNCATE 
--  when we want to delete the data from table but not the structure when we use truncate 
 
 truncate table studentaccess;
 select * from studentaccess;
 -- do 2 steps 
--  first it will drop the whole data 
--  then reconstruct the structure of the data 
-- combination of ddl 

-- interview question 
-- what is the diff btw delete , drop , truncate . 

-- delete  - it is a dml 
-- drop and truncate is a ddl 

-- delete the data based on condtion
-- in drop and truncate not use the condtion means mo condition

-- delete we can roll back the operation . 
-- drop and truncate not have roll back . 


-- drop has table structure has same 
-- delete has delete 
-- truncate has delete the structure but can reconstructured . 


-- DATAtypes 
create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);
insert into test18 values(-129);  -- size is smaller 1 byte    (2*8) = 256  (-128 to 127)

create table test19(id tinyint unsigned ) ; -- all number is positive (255) 
insert into test19 values(10);
insert into test19 values(-128);

-- small int  = 1, medint = 2 , int = 4 , big int  = 8
