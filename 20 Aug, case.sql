
-- case 
	-- when condition then expression 
    -- when condition then express2
    -- else expression 
    
-- end 
select code, name , 
	case 
	    when name = "Aruba" then "Terror Country"
        when name = "angola" then "terrorist"
    
	else "tourism"
    
end as "status" 
from country ;

-- if a country name starts with "A" then you have to print (country with A)
-- if a name start with "S" then print (country with S) 
-- oterwise => country with another name 

use world ;
select * from country ;
SELECT 
    code,
		name,
        case 
			when name LIKE'A%' THEN 'country with A'
			WHEN name LIKE 'S%' THEN 'country with S'
			ELSE 'country with another name'
    END AS country_type
FROM countries;


-- handling null value 
-- in this it neglect the null values but with the help of if null () it changes them into 0 then make a count . 
select name , indepyear ,ifnull(indepyear , 0) from country ;

select count(indepyear) , count(ifnull(indepyear,0)) from country ;


-- null if()
-- when we give 2 expression in null if they are same then it returns null and if both expression are not same the in length then it return 1st expression .

select name , continent , nullif(length(name) , length(continent)) from country ;

select name, population,
	case 
		when population > 200000 then "developed country "
        when population > 100000 then "developing country "
        
	else " under developed "
    end as countrystatus
    from country