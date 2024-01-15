-- Active: 1692420741174@@127.0.0.1@3306
create database ineuron;

show DATABASES;

use ineuron;

create table employees(emp_id INT,
firstname varchar(50),
lastname varchar(50),
dob date,
hiredate date,
position varchar(30),
salary float);

select * from employees;

insert into employees VALUES(1,"og","nmb","2000-02-25","2021-10-05","data-scientist",45000);

insert into employees VALUES(1,"yash","reddy","2000-02-25","2021-10-05","SR_data-scientist",5000);

insert into employees VALUES(1,"arjun","sai_siddarth","2000-02-25","2021-10-05","jr_data-scientist",45000);

insert into employees VALUES(1,"lokesh","kanagaraj","2000-02-25","2021-10-05","data-scientist",4000);

select * from employees;


select firstname,lastname,salary from employees;

# select salary of employee who has more than 21000

select * from employees WHERE salary >= 45000;

#lastname in the asc ORDER BY

select * from employees ORDER BY lastname ASC;

set SQL_SAFE_UPDATES = 0;

update employees set salary = 95000  where firstname = "lokesh";

set SQL_SAFE_UPDATES = 1;

set SQL_SAFE_UPDATES = 0;
update employees set salary = 96000  where firstname = "yash";

select * from employees;

update employees set salary = 98000  where firstname = "arjun";

select * from employees;

set sql_safe_updates = 1;

update employees set salary = 99500  where firstname = "lokesh";


alter table employees add dept varchar(50);


===================================================================================================================================================

few questions of set-1 questions as well.....


show databases;

use assignment;

create table station (id int, city varchar(255), state varchar(5), latn int , longw int);

truncate table city;

select * from station;

select city, state from station;

select distinct city, id  from station where id%2 = 0;


select (count(city) - count(distinct city)) as
'CityCount-DistCityCount' from station;


(select city, length(city) as length from station order by length(city) asc,city
asc limit 1)
union
(select city, length(city) as length from station order by length(city)
desc,city asc limit 1);


SELECT DISTINCT city
FROM station
WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%'
   OR city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%';
   

SELECT DISTINCT city
FROM station
WHERE city LIKE '%A' OR city LIKE '%E' OR city LIKE '%I' OR city LIKE '%O' OR city LIKE '%U'
   OR city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u';
   

SELECT DISTINCT city
FROM station
WHERE (city NOT LIKE 'A%' OR city NOT LIKE 'E%' OR city NOT LIKE 'I%' OR city NOT LIKE 'O%' OR city NOT LIKE 'U%'
   OR city NOT LIKE 'a%' OR city NOT LIKE 'e%' OR city NOT LIKE 'i%' OR city NOT LIKE 'o%' OR city NOT LIKE 'u%')
AND  (city NOT LIKE '%A' AND city NOT LIKE '%E' AND city NOT LIKE '%I' AND city NOT LIKE '%O' AND city NOT LIKE '%U'
   AND city NOT LIKE '%a' AND city NOT LIKE '%e' AND city NOT LIKE '%i' AND city NOT LIKE '%o' AND city NOT LIKE '%u');


   
   
SELECT DISTINCT city
FROM station
WHERE (city NOT LIKE 'A%' AND city NOT LIKE 'E%' AND city NOT LIKE 'I%' AND city NOT LIKE 'O%' AND city NOT LIKE 'U%'
       AND city NOT LIKE 'a%' AND city NOT LIKE 'e%' AND city NOT LIKE 'i%' AND city NOT LIKE 'o%' AND city NOT LIKE 'u%')
  AND (city NOT LIKE '%A' AND city NOT LIKE '%E' AND city NOT LIKE '%I' AND city NOT LIKE '%O' AND city NOT LIKE '%U'
       AND city NOT LIKE '%a' AND city NOT LIKE '%e' AND city NOT LIKE '%i' AND city NOT LIKE '%o' AND city NOT LIKE '%u');
       
       
	
SELECT p.product_id, p.product_name
FROM Product p
LEFT JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date >= '2019-01-01' AND s.sale_date <= '2019-03-31'
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT s.sale_date) = 1;


SELECT p.product_id, p.product_name
FROM Product p
LEFT JOIN Sales s
ON p.product_id = s.product_id
AND s.sale_date >= '2019-01-01'
AND s.sale_date <= '2019-03-31'
LEFT JOIN Sales s2
ON p.product_id = s2.product_id
AND (s2.sale_date < '2019-01-01' OR s2.sale_date > '2019-03-31')
WHERE s.sale_date IS NOT NULL
AND s2.sale_date IS NULL;


SELECT p.product_id, p.product_name
FROM Product p
WHERE p.product_id NOT IN (
    SELECT DISTINCT s.product_id
    FROM Sales s
    WHERE s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31'
)
AND p.product_id IN (
    SELECT DISTINCT s.product_id
    FROM Sales s
    WHERE s.sale_date >= '2019-01-01' AND s.sale_date <= '2019-03-31'
);

















   
   
   
   
   
   
   
   
   
   
   




















































