-- datatype 
-- int (4 byte)  2**32
use regex1 ;
create table yash1(id int );
insert into  yash1 values(-10);
select * from yash1;

create table yash2(id int unsigned );
insert into  yash2 values(-10);
select * from yash2;
-- in unsigned we only put positive values 


-- tiny  int (1byte)
-- small int(2byte)
-- medium byte(3byte)
-- big int (8byte)
drop table yash2;
create table yash2(id bigint unsigned );
insert into  yash2 values(1656268232232626655);
select * from yash2;

drop table yash1;
create table yash1(name char(10));
insert into yash1 values('abc');
insert into yash1 values('abcdjindjoncko');
select name , char_length (name )from yash1;

select length('hey abc'),char_length('hey abc');
-- length = > byte 

-- varchar  
drop table yash1;
create table yash1(name varchar(10));
insert into yash1 values('abc');
insert into yash1 values('abc      '); -- char , truncate upto the size of column
insert  into yash1  values ('a   bc');
select name , char_length(name) from yash1;

-- char and varchar
-- so in char memory is fixed based on the size define 
-- on the other hand memory is not fixed in varhcar 
-- in char the last widespases is truncate 
-- but on the other hand it is truncated upto the size of character 


-- date 
drop table yash1;
create table yash1(dob date);
insert into yash1 values(curdate());
insert into yash1 values('2026-01-30');  -- yy--mm--dd
insert into yash1 values('2026-02-30 '); -- incorrect
insert into yash1 values('2026-13-30 '); 
insert  into yash1  values (now());
select * from yash1;

-- datetime in this we use any date (8byte)
-- timestamp it stores data from 1970 to 2038 .(4byte)
create table yash3(dob timestamp);
insert into yash3 values(now());
select * from yash3;


-- create table yash(do -- );
-- insert into yash1 values (curdate));


-- blob => binary large object used to store binary data such as images , audio , video or anny other type of file in database column.

-- how to store a image in RDBMS system . 

CREATE TABLE yash7(salary DOUBLE(5,2));

create table yash7(salary double(5,2) );
insert into yash7 values(10.2);-- 6 is truncate 
insert into yash6 values(103.21);
insert into yash6 values (10166);
select * from yash6;