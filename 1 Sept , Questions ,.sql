use regex1;
drop table departments ;
drop table employees;
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id));

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO Employees (emp_id, emp_name, manager_id, salary, dept_id) VALUES
(101, 'Alice', NULL, 90000, 3), -- Alice is IT Head
(102, 'Bob', 101, 60000, 3), -- Bob reports to Alice
(103, 'Charlie', 101, 55000, 3), -- Charlie reports to Alice
(104, 'David', 102, 40000, 3), -- David reports to Bob
(105, 'Eve', NULL, 80000, 2), -- Eve is Finance Head
(106, 'Frank', 105, 50000, 2), -- Frank reports to Eve
(107, 'Grace', NULL, 75000, 1), -- Grace is HR Head
(108, 'Heidi', 107, 45000, 1), -- Heidi reports to Grace
(109, 'Ivan', NULL, 70000, 4), -- Ivan is Marketing Head
(110, 'Judy', 109, 48000, 4); -- Judy reports to Ivan

select * from employees;
select * from departments;

-- 1. Employee Hierarchy & Department Performance
SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 2. Find each employee’s manager (if any).
select e.emp_name as employee , m.emp_name as manager from employees e 
left join employees m on e.manager_id = m.emp_id ; 

-- 3. Calculate average salary per department 
select round(avg(e.salary)) as avgsalary, d.dept_name from employees e 
join departments d on e.dept_id  = d.dept_id group by d.dept_name;

-- 4. Find employees who earn more than the average salary of their department.
select e.emp_name as employee , d.dept_name , e.salary  from employees e 
join departments d on e.dept_id = d.dept_id 
where e.salary > (select avg(salary) from employees where dept_id = e.dept_id);

-- 5. Show each employee with manager name, department, and whether they earn.
select e.emp_name as employee , m.emp_name as manager , d.dept_name as department 
from employees e ;

-- 6. Find the highest-paid employee(s) in each department using a subquery. 
select e.emp_name  , e.salary , d.dept_name from employees e 
join departments d on e.dept_id = d.dept_id 
where e.salary = (select max(salary) from employees where dept_id = e.dept_id);

-- 7.  find departments where the average salary is higher than 
-- the overall company avergae salary . 
select d.dept_name ,round( avg(e.salary) ,2) as employee_salary from  employees as e 
join departments  as d on e.dept_id = d.dept_id 
group by d.dept_name having  avg(e.salary)  > (select avg(salary) from employees);