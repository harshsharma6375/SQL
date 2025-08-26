-- Aggregate functions are the special kind of functions that help to do calculations is rows and also called multi row functions  
--  round truncate, mod ,pwr(numeric function) , 

-- round is used to roundoff values 
select 10.5 ,round(10.4) , round(10.56,1) ;
-- using round in value before decimal

select 10.5 ,round(10.4) , round(10.56,1) , round (42.58 , -1) ; 
select 10.5 ,round(10.4) , round(10.56,1) , round (42.58 , -1)  , round(46.58,-1); 

select round(50.58 , -2); -- on the bases of hundred as a place value 
-- after deciaml it gives positive value before that decimal it takes as a negative vale (-2,-1,0,1,2)


-- truncate 
-- it is used to extract the value  
select truncate(76.35,1);

select truncate (76.35,1), round(76.35,1);
select 10.5 ,round(10.4) , round(10.56,1) , round (42.58 , -1), mod (13,3) ,pow(2,3); 
select floor(5.99999),ceil(2.0001);




-- mod is used to find out the reminder 