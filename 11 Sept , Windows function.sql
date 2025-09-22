use tushar ;
select * from employeesales;

-- over is used to apply function in wach row 
select *, sum(saleamount) over(partition  by department) from employeesales;

select *, sum(saleamount) over(partition  by employeename) from employeesales;

insert into employeesales values(12 ,'alice', 'developer' , '2025-06-01' , 5000.00);

select *, sum(saleamount) over(partition  by department , employeename) from employeesales;


-- running sum
-- put the coloumn in order by that is unique that cont be confused  
select *, sum(saleamount) over(order by employeeid) from  employeesales;


select *, sum(saleamount) over(order by saleamount) from  employeesales;

-- running sum in each departemnt 

select *, sum(saleamount) over(partition  by department order by saleamount) from  employeesales;

-- second highest salary 
-- if we dont know the row or data then we dont use this 

select * from employeesales order by saleamount desc limit 1 ,1;


select * from employeesales where saleamount =
( select max(saleamount) from employeesales where  saleamount <
 (select max(saleamount)  from employeesales ) );
 
 -- Third highest 
 select * from employeesales where saleamount =
( select max(saleamount) from employeesales where  saleamount < 
(select max(saleamount) from employeesales where  saleamount <
 (select max(saleamount)  from employeesales ) ));
 
 
 -- windows function 
 -- row_number -> it gives unique rank for all rows 
 select *, row_number() over() from employeesales;
 
 
  select *, row_number() over(partition by department   ) from employeesales;
  
  -- rank -> it isa window function which is used to give a rank to each row  the value if the 
  -- ranking  are shared and the values of  the rank will be shift . 
  
  select *, rank() over(order by saleamount) from employeesales; 
  -- dense rank -> we make a column with the help of backtick  `____ `
   select *, rank() over(partition by department order by saleamount desc) ,
   dense_rank() over(partition by department order by saleamount desc) from  employeesales; 
   
   
   
select *, 
dense_rank() over( order by saleamount desc) as `rank` 
from  employeesales ; 
-- becuase where is executed before rank or dense rank because we cant deifne this before

 with datarank as 
(select *, 
dense_rank() over( order by saleamount desc) as `ranks` 
from  employeesales ) 
select * from datarank where ranks = 10 ;

-- who is the second highest in each department 

 with datarank as 
(select *, 
dense_rank() over( partition by department order by saleamount desc) as `ranks` 
from  employeesales ) 
select * from datarank where ranks = 2 ;

-- lag and lead 
-- backward  and forward 

  select *, lead(saleamount ,2) over(   ) from employeesales;


  select *, lag(saleamount ,2) over(   ) from employeesales;
  
  -- 
  insert into employeesales values(1 ,'Alice', 'sales' , '02025-06-01' , 600.00);
  select * from employeesales;
  
  select * , 
lead(saledate) over(partition by department , employeename order by saledate ) as nextdate ,  
datediff(lead(saledate) over(partition by department , employeename order by saledate ) , saledate  )
from employeesales where employeename = 'Alice' and department = 'Sales' ;
  
  
  
