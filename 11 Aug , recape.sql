use sakila ;

select * from actor
where first_name like 'E%';


select * from actor
where first_name  like '%E%';

-- functions 

-- String functions 
-- functions == block of code  ==> code reuse 
-- def (user defined , pre defined )

-- pre defined 
-- string , date , number 
-- string ==> lower , upper , length , concat , substring , reverse ,left , right , instr , locate , trim 


-- length 
select first_name , length (first_name) from actor;
-- char_length 
select first_name , length (first_name) , char_length (first_name) from actor;

-- length give you the size in byte 
-- char_length => number of character 


-- concat (adding or merging of two words or string )
select first_name ,last_name , concat(first_name, last_name) from actor;

select first_name ,last_name , concat('Mr' , first_name,' ', last_name) ,
-- concat_ws -> it give the separater first 
concat_ws('-','Mr' , first_name,' ', last_name) from actor;


-- substring 
select first_name ,substr(first_name , 2 ),
last_name , concat('Mr' , first_name,' ', last_name) ,
concat_ws('-','Mr' , first_name,' ', last_name) from actor;

select first_name ,substr(first_name , 3 ),
last_name , concat('Mr' , first_name,' ', last_name) ,
concat_ws('-','Mr' , first_name,' ', last_name) from actor;

select first_name ,substr(first_name , 2,3) from actor ;



--  locate => finding the position of character 

select first_name ,locate('E',first_name ) from actor ;
select first_name ,locate('E',first_name ,5) from actor ;

-- replace 
select first_name ,locate('E',first_name ,5), replace (first_name , "E" , "-") from actor ;

-- trim  ==> it helps to delete the no. of wide spaces .
-- it remove spaces only from starting and ending not in between . 
-- we have many options in this also left or right trim . 
select char_length (trim('   hey   '));
select char_length (trim('   h    ey   '));
select char_length (trim(leading from '   hey   '));


-- scaler functions ==> apply on 1 row =. return 1 row 
-- multi row functions category => apply on multiple row and return 1 or more rows as output 
-- aggregate functions  : functions , perform calculations over  the rows 
-- max, min, sum , count 


-- count 
select *  from payment;
select count(amount) from payment ;
select count(amount), sum(amount) from payment ;
select count(amount), sum(amount) ,avg(amount) from payment ;
select count(amount), sum(amount) ,avg(amount) from payment where customer_id = 1;
select count(amount), sum(amount) ,avg(amount) from payment where customer_id = 2;


-- as
select count(amount) as totalTranscation, 
sum(amount) ,avg(amount) as AvgAmount from payment 
where customer_id = 1;
 

-- group : collection of similar values 
-- 1
select customer_id ,  count(amount), sum(amount) from payment group by customer_id;
select * from payment;
