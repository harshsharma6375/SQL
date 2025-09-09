create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);

-- employee have sane salary as that of their department 
select * from departments;
select * from employees;
select empid, empname,deptid,salary 
from employees
where (salary ,deptid) in 
(select avg(salary) , deptid from employees group by deptid );

-- correlated subquery 
-- a correlated  query is a subquery where this depend upon the outer query and it is processed for each row . 
-- how to optimize the subquery (for this one we dont use  correlated subquery ) . 
-- 1) correlated nested query will be executed repetatively 

select e1.empid,e1.empname,e1.deptid,e1.salary
from employees as e1
where e1.salary >
(select avg(salary) from employees as e2 where e1.deptid = e2.deptid);
--  --------------------------
use regex1;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

-- get the student id , st name , deptname , course name that the student is enrolled .
-- get the student name and the avg grade the person has recieve . 


select  * from students ; 
select * from courses ;
select * from enrollments ;

-- Q1) get the student id , st name , deptname , course name that the student is enrolled .
SELECT s.StudentID,
       s.StudentName,
       s.Department AS DeptName,
       c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- Q2) get the student name and the avg grade the person has recieve . 

SELECT s.StudentName,
       AVG(e.Grade) AS AvgGrade
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentName;

-- ------------------
use sakila ;
select * from payment;
select * from customer ;
-- get the payment id ,  the coustmer name ,  the month the last working day of month
--  where the amount spend by the customer is greater then the avg amount spended by the user itself only after the year 2004 .

select payment_id  , c.first_name , c.last_name , monthname(p.payment_date) as payment_month,
last_day(p.payment_date) as last_working_day,p.amount from payment p
join customer c on p.customer_id  = c.customer_id 
where p.amount > (select avg(p2.amount) from payment p2  
where p2.customer_id  = p.customer_id ) and year(p.payment_date) > 2004;
