create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

-- windows functions 

select department , avg(saleamount) from employeeSales group by department;

-- windows function 
select *, 
avg(saleamount) over(),
max(saleamount) over(),
min(saleamount) over() from employeesales;

-- avg sale amount difference from deptartment sale amount
select *, avg(saleamount) over(),
avg(saleamount) over(partition by department )
from employeesales;

-- based on employee name 
select *, avg(saleamount) over(),
avg(saleamount) over(partition by  employeename) 
from employeesales;
 
 -- based on same date 
 select *, avg(saleamount) over(),
avg(saleamount) over(partition by  saledate ) 
from employeesales;

-- based on dept and employee 

select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department , employeename )
from employeeSales;

-- based on sale date 
select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department , saledate )
from employeeSales;

select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by saledate )
from employeeSales;

-- order by  
-- running sum 
select *,
sum(saleamount) over(order by saleamount)  from employeesales;


-- running avg 
select *,
avg(saleamount) over(order by saleamount)  from employeesales;

-- in running sum we dont use partition by 
-- do use in unique value or column to makes table understable easily . 

select *,
sum(saleamount) over(partition by department order by saleamount)  from employeesales;


-- running sum based on the order placed 
select *,
sum(saleamount) over(partition by saledate ) from employeesales;

select *,
sum(saleamount) over(order by saledate ) from employeesales;

select *,
max(saleamount) over(partition by saledate order by saleamount) from employeesales;

-- running sum , based on customer on sakila table .

use sakila ;
select * from payment;
select *,
sum(amount) over (order by customer_id) from payment ;
-- 
select *,
sum(amount) over (order by payment_id desc) from payment ;

-- running avg 
select *,
avg(amount)   over (order by customer_id) from payment ;
