-- ddl statment with constraints 
-- constraints
-- they are the rules apply to table  -- accurate -- invalid restrict (invalid data )
-- Constraints are rules or restrictions that we put on something.
-- They stop wrong data from going in and make sure everything is correct.
-- not null (basic constraints)








-- NOT NULL → This column cannot be empty.

use regex1;
create table test1(id int , salary int) ;
insert into test1 values(10,900);
insert into test1 values(11,null);
select * from test1;
drop table test1;
create table test1(id int , salary int not null ) ;
insert into test1 values(10,900);
insert into test1 values(11,null); -- error here 
select * from test1;
insert into test1 values(null,500) ;
-- not giving error because we used not null in salary 
drop table test1;

-- DEFAULT → If no value is given, use this default value.
create table test2(id int default 0 , salary int not null ) ;
insert into test2 values(10,900);
insert into test2(salary) values(500) ;
select * from test2;

-- UNIQUE → All values must be different.
create table test3(id int  , salary int default 100 unique) ;
insert into test3 values(10,900);
insert into test3 values(11,900); -- error here 
insert into test3(id) values(1999991) ;

insert into test3(id) values(20012) ;
select * from test3;

-- PRIMARY KEY → A special column that uniquely identifies each row.

create table test4(id int primary key , salary int) ;
insert into test4 values(11,500);
select * from test4;
insert into test4 values(11,900); -- error here  
insert into test4(id) values(null); -- error 
select * from test4;

-- ---------------------------------
-- FOREIGN KEY → Connects one table to another.


drop table studentinfo;
drop table courses1;

create table courses1(course_id int primary key , cname varchar(20));
insert into courses1 values(10, 'dsa') , (11 , 'python');
select * from courses1;


-- applying foregin key 
create table studentinfo(sid int primary key , sname varchar(20),
course_id int, 
foreign key (course_id)
references courses1(course_id));

select * from courses1 ;
 
insert into studentinfo values(1,'tushar',10);
insert into studentinfo values(2,'aman',11);
insert into studentinfo values(3,'aman',13); -- error here 


-- CHECK → Value must follow a condition (e.g., Age > 18).
