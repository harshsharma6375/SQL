 -- revision 
 use regex1 ;
 select * from employees;
 select * from departments ;
 
 -- find the employees name who have the salary than the avg salary from dept 
 
 select * from departments ;
 select * from employees where dept_id= 2 and salary > 60000 ;
 select dept_id, avg(salary) from employees where dept_id = 1;
 
 
 select dept_id, avg(salary) from employees where dept_id = 2;
select * from employees where dept_id= 2 and salary > 60000 ;
  
  
  select emp_id , emp_name  , salary , dept_id 
  where salary > 
  select  avg(salary)from employees as inn where inn.deot_id = oute.dept_id group by dept_id; 