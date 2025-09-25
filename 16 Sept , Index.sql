use regex1 ; 
create table test(id int , name varchar(20)) ; 
insert into test values (10 , "abc") , (11, "def") , (15,"ghi") , (18,"ujjwal"),(14,"piyus") ; 

#🔹 Big-O Notation क्या है?
# Big-O notation एक तरीका है यह बताने का कि किसी algorithm को चलने में कितना time लगता है या उसकी performance कैसी है, जब input size बड़ा होता है।

explain select * from test where id = 15 ; 

# INDEX --> Index is are nothing  this is a mechanism which is used to access data in fastway from your database

-- Types of Indexing --
		-- 1. Cluster index -->
                -- Definition: Data is stored physically on disk in the same order as the index and match the orders.
                -- preventing duplicate values
			    -- Means table itself is arranged (sorted) by the clustered index.
				-- One table can have only ONE clustered index, because data can’t be physically stored in two ways.
				-- Usually created automatically on the Primary Key.

		-- 2. non-Cluster index -->
				-- Definition: Data is stored separately from the index.
				-- Non-clustered index just keeps a pointer (reference) to the actual row.
				-- A table can have multiple non-clustered indexes.
				-- Useful when you want to search by different columns.
                

explain select * from test where name = 'ujjwal';

-- for non-cluster
create index test_index on test(name);
explain select * from test where name = 'ujjwal';
                
show indexes from test;
                
                
-- composite index ... an index create on multiple columns of a table



-- assignment --
-- 1. try to create a unique index on your table
-- 2. on a table kisi ek column ko primary or ek ko unique key banan h or check krna h konsa cluster h or konsa non cluster 
-- 3. ek index banan h or uski visiblity off krna h or check krna h select query se ki vo kam aa rha h ya nhi 


-- learning assignment 
-- ek table m cluster bna rkha h ....hmare pas new data aaya millons m to uss case m kya krna chahiye

CREATE INDEX test_index
ON test(name);
explain select * from test where name = 'ujjwal';

select * from test ; 
# Q.1 Write to create a unique index on any table which you have?
create unique index idx_unique_id on test(id) ; 
explain select * from test where id = 15 ; 

CREATE TABLE customer_dubli (
    customer_id INT PRIMARY KEY,  -- Primary key
    email VARCHAR(100) UNIQUE,    -- Unique key
    name VARCHAR(50)
);

SHOW INDEX FROM customer_dubli;
#PRIMARY → Primary Key → Clustered Index (MySQL me)
#email → Unique Key → Non-Clustered Index
# MySQL me sirf primary key clustered hoti hai, baaki sab non-clustered.
-- Table ke indexes check karne ke liye
EXEC sp_helpindex 'customer';