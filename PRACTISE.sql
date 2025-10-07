-- Windows Function

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
select * from employeesales;

-- normal format 
select department , avg(saleamount)  from employeesales group by department;

-- windows function 
select *,
avg(saleamount) over() from employeesales;


-- avg salary amount difference from department sale amount
select *,avg(saleamount) over(),
avg(saleamount) over(partition by department) from employeesales;


-- based on employee name 
select *,
avg(saleamount) over(),
avg(saleamount) over (partition by employeename) from employeesales;

-- based on same date 
select *,
avg(saleamount) over(),
avg(saleamount) over (partition by saledate) from employeesales;


-- based on dept and employee 
select*,
avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department ,employeename) from employeesales;

-- based on sale date 
select *,
avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department , saledate) from employeesales;

-- based on only sale date 
select*,
avg(saleamount) over(partition by department),
avg(saleamount) over(partition by saledate) from employeesales;


-- order by 
-- running sum

-- running sum from salesamount 
select *,
sum(saleamount) over(order by saleamount) from employeesales ;

-- in running sum we dont use  partition by 
-- do use in unique value or column to make table understable easily . 


-- running sum with department and sum with saleamount . 
select *,
sum(saleamount) over(partition by department order by saleamount) from employeesales;

-- running sum based on the order placed .
select *,
sum(saleamount) over(partition by saledate ) from employeesales ; 

select *,
sum(saleamount) over(order by saledate) from employeesales ; 

select *,
sum(saleamount) over(partition by saledate order by saleamount) from employeesales ; 


select *,
max(saleamount) over(partition by saledate order by saleamount) from employeesales;


-- windows , correlated , cte 
USE REGEX1;
CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees1 (emp_id, emp_name, department, salary, manager_id, hire_date) VALUES
(1, 'Alice', 'HR',       50000, NULL,      DATE '2015-01-10'),
(2, 'Bob',   'HR',       60000, 1,         DATE '2016-03-15'),
(3, 'Carol', 'Finance',  75000, NULL,      DATE '2014-07-20'),
(4, 'David', 'Finance',  72000, 3,         DATE '2018-08-01'),
(5, 'Eva',   'Finance',  80000, 3,         DATE '2020-11-11'),
(6, 'Frank', 'IT',       90000, NULL,      DATE '2013-12-05'),
(7, 'Grace', 'IT',       88000, 6,         DATE '2017-06-30'),
(8, 'Henry', 'IT',       87000, 6,         DATE '2019-02-18'),
(9, 'Ivy',   'Sales',    55000, NULL,      DATE '2015-09-25'),
(10,'Jack',  'Sales',    53000, 9,         DATE '2021-01-14');
-- Find employees who earn more than the average salary of their department.
SELECT * FROM EMPLOYEES1;
SELECT  EMP_NAME , SALARY , DEPARTMENT   FROM EMPLOYEES1 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES1 )  ; 

SELECT emp_name, salary, department
FROM employees1 e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees1
    WHERE department = e.department
);

-- List employees whose salary is higher than their manager’s salary.
SELECT * FROM EMPLOYEES1;

SELECT e.emp_id , e.emp_name , e.salary , m.manager_id  , m.emp_name as manager_name ,
 m.salary as manager_salary 
from employees1 e 
join employees1 m
on e.manager_id = m.manager_id where e.salary > m.salary ;

-- Find departments where the highest salary is greater than 80,000.

select  department from employees1 where salary > 80000 group by department ;
select salary , department from employees1 where salary > (select max(salary) from employees1 where salary > 80000 ) ;



-- Show each employee’s salary along with the average salary of their department.
select department ,avg(salary) 
over (partition by department  ) from employees1   ;


-- Find the top 2 highest paid employees per department.
select emp_name , department ,  max(salary) 
over (partition by department  order by salary desc ) from employees1 ;

-- For each employee, show the difference between their salary and the department’s highest salary.
select emp_name , department , salary ,max(salary) 
over (partition by department) -  salary as salary_diff from employees1 ;


-- Display employees with their previous hire date in the same department (using LAG()).
select * from employees1;

select emp_name , hire_date , lag(hire_date ) over ( )from employees1;
--  CTE Questions

-- Use a CTE to find the second highest salary in the company.
use regex1 ;
with cte as 
(select emp_id , emp_name , salary , dense_rank() over(order by salary desc )  as rnk from employees1 ) 
select emp_id , emp_name , salary from cte where rnk = 2 ;


-- Write a recursive CTE to list employees under each manager (hierarchy expansion).

USE regex1;

WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: start with top-level managers (no manager)
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        0 AS level
    FROM employees1
    WHERE manager_id IS NULL   -- or 0, depending on your schema

    UNION ALL

    -- Recursive member: get employees reporting to the ones in the previous level
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employees1 e
    INNER JOIN EmployeeHierarchy eh
        ON e.manager_id = eh.emp_id
)
SELECT *
FROM EmployeeHierarchy
ORDER BY level, manager_id, emp_id;

