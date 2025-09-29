select * from employees;

-- cursor -> cursor is a object that is used to access each row one by one . 
-- cursor is used to access the result of select statment 
-- There are basically two type of cursor 
-- 1_ implicit cursor -> it is execucted when you execute any DML operation 
--here we do not have to create  we dont need to fetch , open or close it . 
--in sql implicit cursor attributes are -> found , not found  , row count , isopen 

-- ctas create table as select
CREATE TABLE test_ctas AS
SELECT employee_id,
       'yash' AS first_name   -- override value with yash
FROM employees
WHERE employee_id BETWEEN 100 AND 104;



set serveroutput on ; 
select * from employees;
begin 
    update test set First_name = 'yash'  where
    employee_id between  100 and 104 ;
    if sql%found then 
    DBMS_output.put_line('row affected' || '' || sql%rowcount);
    
    else 
    dbms_output.put_line('implict cursor is not created');
    
    end if ;
    
end ; 


--explicit cursor are cusor which allow you to access row by row 
-- record = row 
-- percentage record -> 


CREATE TABLE test2 AS
SELECT employee_id, first_name
FROM employees
WHERE employee_id BETWEEN 100 AND 104;



set serveroutput on ; 

DECLARE
    -- cursor declaration
    CURSOR emp_cur IS 
        SELECT * FROM test2;
    
    emp_data test2%ROWTYPE;  -- record to hold one row
BEGIN
    -- open cursor 
    OPEN emp_cur;

    -- first fetch before loop
    FETCH emp_cur INTO emp_data;

    WHILE emp_cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(emp_data.first_name || ' - ' || emp_data.employee_id);

        -- fetch next row
        FETCH emp_cur INTO emp_data;
    END LOOP;

    -- close cursor
    CLOSE emp_cur;
end ; 


-- with for loop 

set serveroutput on ; 

DECLARE
    -- cursor declaration
    CURSOR emp_cur IS 
        SELECT * FROM test2;
    
    emp_data test2%ROWTYPE;  -- record to hold one row
BEGIN
    -- open cursor 
   for emp_date in emp_cur loop -- same as while loop
   DBMS_output.PUT_Line(emp_data.first_name);
   end loop ;

end ; 

-- triggers 
--why we use it 
--types of triggers 
--what are the advantages of trigger
--
--trigger vs cursor 
