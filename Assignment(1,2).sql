
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


show databases;

use assignment;

create table city (id int , name varchar(27), countrycode varchar(27), district varchar(27) , population int );

select * from city;

select * from city where countrycode = 'USA' and population > 100000;

select name from city where countrycode = 'USA' and population > 120000;

select * from city;


select * from city where id = 1661;


select * from city where countrycode = 'JPN';

create table station (id int, city varchar(255), state varchar(5), latn int , longw int);

select * from station;

show databases;

show tables;



select city, state from station;

select distinct city, id  from station where id%2 = 0;

select distinct city from station where id%2 = 0;

select (count(city) - count(distinct city))  from station;



(select city, length(city) as length from station order by length(city) asc,city
asc limit 1)
union
(select city, length(city) as length from station order by length(city)
desc,city desc limit 1);

(select city, length(city) as length from station order by length(city) asc,city
asc limit 1)
union
(select city, length(city) as length from station order by length(city)
desc,city asc limit 1);



#The below query  checks if the leftmost character of the city column (retrieved using the LEFT function) is in the list of vowels ('a', 'e', 'i', 'o', 'u'). 
#If the condition is met, the city name is included in the result.

select distinct city from station where left(city,1) in ('a','e','i','o','u');

# Another approach

SELECT DISTINCT city
FROM station
WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%'
   OR city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%';
   
## character of city column ending with vowel
select distinct city from station where right(city,1) in ('a','e','i','o','u');

# another approach

SELECT DISTINCT city
FROM station
WHERE city LIKE '%A' OR city LIKE '%E' OR city LIKE '%I' OR city LIKE '%O' OR city LIKE '%U'
   OR city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u';
   
   
# starting character of city is not vowel
select distinct city from station where left(city,1) not in
('a','e','i','o','u');

# another SOLN

SELECT DISTINCT city
FROM station
WHERE city NOT LIKE 'A%' OR city  NOT LIKE 'E%' OR city NOT LIKE 'I%' OR city  NOT LIKE 'O%' OR city NOT LIKE 'U%'
   OR city NOT LIKE 'a%' OR city NOT LIKE 'e%' OR city NOT LIKE 'i%' OR city NOT LIKE 'o%' OR city NOT LIKE 'u%';

# ending not vowel
select distinct city from station where right(city,1) not in
('a','e','i','o','u');

# another soln
SELECT DISTINCT city
FROM station
WHERE city NOT LIKE '%A' OR city NOT LIKE '%E' OR city NOT LIKE '%I' OR city NOT LIKE '%O' OR city NOT LIKE '%U'
   OR city NOT LIKE '%a' OR city NOT LIKE '%e' OR city NOT LIKE '%i' OR city NOT LIKE '%o' OR city NOT LIKE '%u';
   
# donot start and donot end with vowel 
select distinct city from station where left(city,1) not in
('a','e','i','o','u') or right(city,1) not in ('a','e','i','o','u');

# another soln
SELECT DISTINCT city
FROM station
WHERE (city NOT LIKE 'A%' OR city NOT LIKE 'E%' OR city NOT LIKE 'I%' OR city NOT LIKE 'O%' OR city NOT LIKE 'U%'
   OR city NOT LIKE 'a%' OR city NOT LIKE 'e%' OR city NOT LIKE 'i%' OR city NOT LIKE 'o%' OR city NOT LIKE 'u%')
AND  (city NOT LIKE '%A' AND city NOT LIKE '%E' AND city NOT LIKE '%I' AND city NOT LIKE '%O' AND city NOT LIKE '%U'
   AND city NOT LIKE '%a' AND city NOT LIKE '%e' AND city NOT LIKE '%i' AND city NOT LIKE '%o' AND city NOT LIKE '%u');
   
########################################################

create table product (p_id int , p_name varchar(25), unit_price int);

insert into product values(1, "s8", 1000),(2,"g4",800),(3,"iphone",1400);

select * from product;

CREATE table  sales (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date INT,
    Quantity INT,
    Price INT
);

ALTER TABLE sales
CHANGE COLUMN  product_id p_id  INT;



INSERT INTO sales (seller_id, p_id, buyer_id, sale_date, Quantity, Price)
VALUES
    (1, 1, 1, 20190121, 2, 2000),
    (1, 2, 2, 20190217, 1, 800),
    (2, 2, 3, 20190602, 1, 800),
    (3, 3, 4, 20190513, 2, 2800);
    
select * from sales;

## one approach
(
    SELECT DISTINCT p.p_id, p.p_name
    FROM product p
    INNER JOIN sales s ON p.p_id = s.p_id
    WHERE s.sale_date >= 20190101 AND s.sale_date <= 20190331
)
EXCEPT
(
    SELECT DISTINCT p.p_id, p.p_name
    FROM product p
    INNER JOIN sales s ON p.p_id = s.p_id
    WHERE s.sale_date < 20190101 OR s.sale_date > 20190331
);



CREATE TABLE views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

INSERT INTO views (article_id, author_id, viewer_id, view_date)
VALUES
    (1, 3, 5, '2019-08-01'),
    (1, 3, 6, '2019-08-02'),
    (2, 7, 7, '2019-08-01'),
    (2, 7, 6, '2019-08-02'),
    (4, 7, 1, '2019-07-22'),
    (3, 4, 4, '2019-07-21'),
    (3, 4, 4, '2019-07-21');

select * from views;

select distinct author_id as id from views where author_id = viewer_id order by
author_id asc;


##################oct 19 2023 Day-2 continued ###############

CREATE TABLE delivery (
    d_id INT,
    c_id INT,
    order_date DATE,
    cust_pref_deliver_date DATE
);


INSERT INTO delivery (d_id, c_id, order_date, cust_pref_deliver_date)
VALUES
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 5, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-11'),
    (4, 3, '2019-08-24', '2019-08-26'),
    (5, 4, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13');
    
    
## first case checks orderdate and preferred date are same or not then sum function returns total not of immediate orders and then count(*) calculates total no:of rows in the table so (2/6)*100 == 33.33%
SELECT ROUND(
    (SUM(CASE WHEN order_date = cust_pref_deliver_date THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
) AS immediate_orders_percentage
FROM delivery;

## another solution

select round((select count(*) from delivery where order_date =
cust_pref_deliver_date)/count(*)*100,2) as immediate_percentage from
delivery;


########

create table ads(ad_id int , user_id int, action varchar(20));

INSERT INTO ads (ad_id, user_id, action)
VALUES
    (1, 1, 'clicked'),
    (2, 2, 'clicked'),
    (3, 3, 'viewed'),
    (5, 5, 'ignored'),
    (1, 7, 'ignored'),
    (2, 7, 'viewed'),
    (3, 5, 'clicked'),
    (1, 4, 'viewed'),
    (2, 11, 'viewed'),
    (1, 2, 'clicked');

select * from ads;

select t.ad_id, (case
when base != 0 then round(t.num/t.base*100,2) else 0 end) as Ctr from (select
ad_id,
sum( case when action = 'clicked' or action = 'viewed' then 1 else 0 end) as
base,
sum( case when action = 'clicked' then 1 else 0 end) as num
from ads
group by ad_id)t
order by Ctr desc, t.ad_id asc;

####

show databases;
use assignment;

create table employee (emp_id int , t_id int);

select * from employee;

insert into employee values (1,8),(2,8),(3,8),(4,7),(5,9),(6,9);

select employee_id, count(team_id) over (partition by team_id) as team_size from
employee order by employee_id;

################################################################################################
CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255)
);

INSERT INTO Countries (country_id, country_name)
VALUES
    (2, 'USA'),
    (3, 'Australia'),
    (7, 'Peru'),
    (5, 'China'),
    (8, 'Morocco'),
    (9, 'Spain');
    
select * from Countries;

-- Create Weather table
CREATE TABLE Weather (
    country_id INT,
    weather_state INT,
    day DATE,
    PRIMARY KEY (country_id, day)
);

-- Insert data into Weather table
INSERT INTO Weather (country_id, weather_state, day)
VALUES
    (2, 15, '2019-11-01'),
    (2, 12, '2019-10-28'),
    (2, 12, '2019-10-27'),
    (3, -2, '2019-11-10'),
    (3, 0, '2019-11-11'),
    (3, 3, '2019-11-12'),
    (5, 16, '2019-11-07'),
    (5, 18, '2019-11-09'),
    (5, 21, '2019-11-23'),
    (7, 25, '2019-11-28'),
    (7, 22, '2019-12-01'),
    (7, 20, '2019-12-02'),
    (8, 25, '2019-11-05'),
    (8, 27, '2019-11-15'),
    (8, 31, '2019-11-25'),
    (9, 7, '2019-10-23'),
    (9, 3, '2019-12-23');
    
select * from Weather;

SELECT c.country_name,
       CASE 
           WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
           WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
           ELSE 'Warm'
       END AS weather_type
FROM Countries c
LEFT JOIN Weather w ON c.country_id = w.country_id
                  AND EXTRACT(MONTH FROM w.day) = 11
                  AND EXTRACT(YEAR FROM w.day) = 2019
GROUP BY c.country_id, c.country_name;


########################################
-- Create Prices table
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    Price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);

-- Insert data into Prices table
INSERT INTO Prices (product_id, start_date, end_date, Price)
VALUES
    (1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);

-- Create UnitsSold table
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    Units INT
);

-- Insert data into UnitsSold table
INSERT INTO UnitsSold (product_id, purchase_date, Units)
VALUES
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);


SELECT us.product_id,
       ROUND(SUM(p.Price * us.Units) / SUM(us.Units), 2) AS average_price
FROM UnitsSold us
JOIN Prices p ON us.product_id = p.product_id
             AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY us.product_id;


############################################################################

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 13),
    (1, 2, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

-- Execute the final query to find the first login date for each player
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

##########################################################

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

select * from Activity;

-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

-- Execute the final query to report the device that is first logged in for each player
WITH RankedActivity AS (
    SELECT 
        player_id,
        device_id,
        event_date,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
)

SELECT player_id, device_id
FROM RankedActivity
WHERE rn = 1;

############################################################################

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255)
);

-- Insert data into Products table
INSERT INTO Products (product_id, product_name, product_category)
VALUES
    (1, 'Leetcode Solutions', 'Book'),
    (2, 'Jewels of Stringology', 'Book'),
    (3, 'HP Laptop', 'Laptop'),
    (4, 'Lenovo Laptop', 'Laptop'),
    (5, 'Leetcode Kit', 'T-shirt');
    
select * from Products;

-- Create Orders table
CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    Unit INT
);

-- Insert data into Orders table
INSERT INTO Orders (product_id, order_date, Unit)
VALUES
    (1, '2020-02-05', 60),
    (1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2),
    (3, '2020-02-24', 3),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);
    
select * from Orders;

-- Execute the final query to get the names of products that have at least 100 units ordered in February 2020 and their amount
SELECT p.product_name, SUM(o.Unit) AS Unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.Unit) >= 100;

######################################################################################

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    mail VARCHAR(255)
);

-- Insert data into Users table
INSERT INTO Users (user_id, name, mail)
VALUES
    (1, 'Winston', 'winston@leetcode.com'),
    (2, 'Jonathan', 'jonathanisgreat'),
    (3, 'Annabelle', 'bella-@leetcode.com'),
    (4, 'Sally', 'sally.come@leetcode.com'),
    (5, 'Marwan', 'quarz#2020@leetcode.com'),
    (6, 'David', 'david69@gmail.com'),
    (7, 'Shapiro', '.shapo@leetcode.com');

-- Execute the final query to find users with valid emails
SELECT user_id, name, mail
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$';

######################################################################3

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    Name VARCHAR(255),
    Country VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, Name, Country)
VALUES
    (1, 'Winston', 'USA'),
    (2, 'Jonathan', 'Peru'),
    (3, 'Moustafa', 'Egypt');

select * from Customers;
-- Create Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    description VARCHAR(255),
    price INT
);

-- Insert data into Product table
INSERT INTO Product (product_id, description, price)
VALUES
    (10, 'LC Phone', 300),
    (20, 'LC T-Shirt', 10),
    (30, 'LC Book', 45),
    (40, 'LC Keychain', 2);

Select * from Product;
-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
    (1, 1, 10, '2020-06-10', 1),
    (2, 1, 20, '2020-07-01', 1),
    (3, 1, 30, '2020-07-08', 2),
    (4, 2, 10, '2020-06-15', 2),
    (5, 2, 40, '2020-07-01', 10),
    (6, 3, 20, '2020-06-24', 2),
    (7, 3, 30, '2020-06-25', 2),
    (9, 3, 30, '2020-05-08', 3);

select * from Orders;

-- Execute the final query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020
WITH MonthlySpending AS (
    SELECT
        c.customer_id,
        c.Name,
        MONTH(o.order_date) AS month,
        SUM(p.price * o.quantity) AS total_spending
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
    WHERE o.order_date >= '2020-06-01' AND o.order_date < '2020-08-01'
    GROUP BY c.customer_id, MONTH(o.order_date)
)

SELECT customer_id, Name
FROM MonthlySpending
GROUP BY customer_id, Name
HAVING MIN(total_spending) >= 100;

###########################################################################

-- Create TVProgram table
CREATE TABLE TVProgram (
    program_date DATE,
    content_id INT,
    channel VARCHAR(255),
    PRIMARY KEY (program_date, content_id)
);

-- Insert data into TVProgram table
INSERT INTO TVProgram (program_date, content_id, channel)
VALUES
    ('2020-06-10', 1, 'LC-Channel'),
    ('2020-05-11', 2, 'LC-Channel'),
    ('2020-05-12', 3, 'LC-Channel'),
    ('2020-05-13', 4, 'Disney Ch'),
    ('2020-06-18', 4, 'Disney Ch'),
    ('2020-07-15', 5, 'Disney Ch');

-- Create Content table
CREATE TABLE Content (
    content_id INT PRIMARY KEY,
    Title VARCHAR(255),
    Kids_content ENUM('Y', 'N'),
    content_type VARCHAR(255)
);

-- Insert data into Content table
INSERT INTO Content (content_id, Title, Kids_content, content_type)
VALUES
    (1, 'Leetcode Movie', 'N', 'Movies'),
    (2, 'Alg. for Kids', 'Y', 'Series'),
    (3, 'Database Sols', 'N', 'Series'),
    (4, 'Aladdin', 'Y', 'Movies'),
    (5, 'Cinderella', 'Y', 'Movies');

-- Execute the final query to report the distinct titles of kid-friendly movies streamed in June 2020
SELECT DISTINCT c.Title
FROM TVProgram p
JOIN Content c ON p.content_id = c.content_id
WHERE c.Kids_content = 'Y'
  AND c.content_type = 'Movies'
  AND MONTH(p.program_date) = 6
  AND YEAR(p.program_date) = 2020;


##################################################################################################################

-- Create NPV table
CREATE TABLE NPV (
    Id INT,
    Year INT,
    Npv INT,
    PRIMARY KEY (Id, Year)
);

-- Insert data into NPV table
INSERT INTO NPV (Id, Year, Npv)
VALUES
    (1, 2018, 100),
    (7, 2020, 30),
    (13, 2019, 40),
    (1, 2019, 113),
    (2, 2008, 121),
    (3, 2009, 12),
    (11, 2020, 99),
    (7, 2019, 0);

-- Create Queries table
CREATE TABLE Queries (
    Id INT,
    Year INT,
    PRIMARY KEY (Id, Year)
);

-- Insert data into Queries table
INSERT INTO Queries (Id, Year)
VALUES
    (1, 2019),
    (2, 2008),
    (3, 2009),
    (7, 2018),
    (7, 2019),
    (7, 2020),
    (13, 2019);

-- Execute the final query to find the NPV of each query in the Queries table
SELECT q.Id, q.Year, COALESCE(n.Npv, 0) AS Npv
FROM Queries q
LEFT JOIN NPV n ON q.Id = n.Id AND q.Year = n.Year;

########################################################################################################

-- Create NPV table
CREATE TABLE NPVV (
    Id INT,
    Year INT,
    Npvv INT,
    PRIMARY KEY (Id, Year)
);

-- Insert data into NPV table
INSERT INTO NPVV (Id, Year, Npv)
VALUES
    (1, 2018, 100),
    (7, 2020, 30),
    (13, 2019, 40),
    (1, 2019, 113),
    (2, 2008, 121),
    (3, 2009, 12),
    (11, 2020, 99),
    (7, 2019, 0);

-- Create Queries table
CREATE TABLE Queries (
    Id INT,
    Year INT,
    PRIMARY KEY (Id, Year)
);

-- Insert data into Queries table
INSERT INTO Queries (Id, Year)
VALUES
    (1, 2019),
    (2, 2008),
    (3, 2009),
    (7, 2018),
    (7, 2019),
    (7, 2020),
    (13, 2019);

-- Execute the final query to find the NPV of each query in the Queries table
SELECT q.Id, q.Year, COALESCE(n.Npvv, 0) AS Npvv
FROM Queries q
LEFT JOIN NPVV n ON q.Id = n.Id AND q.Year = n.Year;


#####################################################################################################

-- Create Employees table
CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(255)
);

-- Insert data into Employees table
INSERT INTO Employees (Id, Name)
VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');

-- Create EmployeeUNI table
CREATE TABLE EmployeeUNI (
    Id INT PRIMARY KEY,
    unique_id INT
);

-- Insert data into EmployeeUNI table
INSERT INTO EmployeeUNI (Id, unique_id)
VALUES
    (3, 1),
    (11, 2),
    (90, 3);

-- Execute the final query to show the unique ID of each user
SELECT e.Id, e.Name, eu.unique_id
FROM Employees e
LEFT JOIN EmployeeUNI eu ON e.Id = eu.Id;

##################################################################################


select * from assignment;

show tables;
-- Create Users table
CREATE TABLE Users (
    Id INT PRIMARY KEY,
    Name VARCHAR(255)
);

-- Insert data into Users table
INSERT INTO Users (Id, Name)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');

-- Create Rides table
CREATE TABLE Rides (
    Id INT PRIMARY KEY,
    user_id INT,
    Distance INT
);

-- Insert data into Rides table
INSERT INTO Rides (Id, user_id, Distance)
VALUES
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);

-- Execute the final query to report the distance travelled by each user
SELECT u.Name, COALESCE(SUM(r.Distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.Id = r.user_id
GROUP BY u.Id, u.Name
ORDER BY travelled_distance DESC, u.Name;


#################################################################################################

select p.product_name, sum(o.unit) as unit
from
Products p
left join
Orders o
on p.product_id = o.product_id
where month(o.order_date) = 2 and year(o.order_date) = 2020
group by p.product_id
having unit >= 100;

#############################################################

show tables;

-- Create Users table
CREATE TABLE Users (
    Id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create Rides table
CREATE TABLE rides (
    Id INT PRIMARY KEY,
    user_id INT,
    distance INT,
    FOREIGN KEY (user_id) REFERENCES Users(Id)
);

-- Insert data into Users table
INSERT INTO Users (Id, name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');

-- Insert data into Rides table
INSERT INTO rides (Id, user_id, distance) VALUES
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);

-- Final Query
SELECT
    u.name,
    COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM
    Users u
LEFT JOIN
    Rides r ON u.Id = r.user_id
GROUP BY
    u.Id, u.name
ORDER BY
    travelled_distance DESC, u.name ASC;
    
    
    
################################################################

-- Create Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

select * from Employees;
-- Create EmployeeUNI table
CREATE TABLE EmployeeUNI (
    id INT PRIMARY KEY,
    unique_id INT
);

-- Insert data into Employees table
INSERT INTO Employees (id, name) VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');

-- Insert data into EmployeeUNI table
INSERT INTO EmployeeUNI (id, unique_id) VALUES
    (3, 1),
    (11, 2),
    (90, 3);

-- Final Query
select u.unique_id, e.name
from
employees e
left join
employeeUNI u
on e.id = u.id;


##########################################################

show tables;
-- Create Departments table
CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create Students table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department_id INT
);

-- Insert data into Departments table
INSERT INTO Departments (id, name) VALUES
    (1, 'Electrical Engineering'),
    (7, 'Computer Engineering'),
    (13, 'Business Administration');

-- Insert data into Students table
INSERT INTO Students (id, name, department_id) VALUES
    (23, 'Alice', 1),
    (1, 'Bob', 7),
    (5, 'Jennifer', 13),
    (2, 'John', 14),
    (4, 'Jasmine', 77),
    (3, 'Steve', 74),
    (6, 'Luis', 1),
    (8, 'Jonathan', 7),
    (7, 'Daiana', 33),
    (11, 'Madelynn', 1);

-- Final Query
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.id
WHERE d.id IS NULL;


################################################################


CREATE TABLE Calls (
    from_id INT,
    to_id INT,
    duration INT
);

-- Inserting sample data into the Calls table
INSERT INTO Calls (from_id, to_id, duration) VALUES
(1, 2, 59),
(2, 1, 11),
(1, 3, 20),
(3, 4, 100),
(3, 4, 200),
(3, 4, 200),
(4, 3, 499);

-- Final query to report the number of calls and total call duration between each pair of distinct persons
SELECT
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM Calls
GROUP BY person1, person2;

####################################################

CREATE TABLE Pprices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    Price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);

CREATE TABLE UnitsSoldd (
    product_id INT,
    purchase_date DATE,
    Units INT
);

-- Inserting sample data into the Prices table
INSERT INTO Pprices (product_id, start_date, end_date, Price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

-- Inserting sample data into the UnitsSold table
INSERT INTO UnitsSoldd (product_id, purchase_date, Units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

-- Final query to find the average selling price for each product
SELECT
    us.product_id,
    ROUND(SUM(p.Price * us.Units) / SUM(us.Units), 2) AS average_price
FROM
    UnitsSold us
JOIN
    Prices p ON us.product_id = p.product_id
            AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    us.product_id;
    
##################################################################################
-- Create Products table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    Width INT,
    Length INT,
    Height INT
);

-- Insert data into Products table
INSERT INTO Product (product_id, product_name, Width, Length, Height)
VALUES
    (1, 'LC-TV', 5, 50, 40),
    (2, 'LC-KeyChain', 5, 5, 5),
    (3, 'LC-Phone', 2, 10, 10),
    (4, 'LC-T-Shirt', 4, 10, 20);

-- Create Warehouse table
CREATE TABLE Warehouse (
    Name VARCHAR(255),
    product_id INT,
    Units INT,
    PRIMARY KEY (Name, product_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert data into Warehouse table
INSERT INTO Warehouse (Name, product_id, Units)
VALUES
    ('LCHouse1', 1, 1),
    ('LCHouse1', 2, 10),
    ('LCHouse1', 3, 5),
    ('LCHouse2', 1, 2),
    ('LCHouse2', 2, 2),
    ('LCHouse3', 4, 1);

-- Run the final query
select sale_date,
sum(case when fruit = 'apples' then sold_num
else (-sold_num) end) as diff
from sales
group by sale_date;

#############################################################

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);
    
-- Final Query
select round(t.player_id/(select count(distinct player_id) from activity),2) as
fraction
from
(
select distinct player_id,
datediff(event_date, lead(event_date, 1) over(partition by player_id order by
event_date)) as diff
from activity ) t
where diff = -1;

############################

CREATE TABLE Emp (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Department VARCHAR(255),
    managerId INT
);

INSERT INTO Emp (Id, Name, Department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

select t.name from
(select a.id, a.name, count(b.managerID) as no_of_direct_reports from
employee a
INNER JOIN
employee b
on a.id = b.managerID
group by b.managerID) t
where no_of_direct_reports >= 5
order by t.name;


######################################################################################

-- Creating Department table
CREATE TABLE Dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);

-- Inserting data into Department table
INSERT INTO Dept (dept_id, dept_name)
VALUES
    (1, 'Engineering'),
    (2, 'Science'),
    (3, 'Law');

-- Creating Student table
CREATE TABLE Std (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    gender VARCHAR(1),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Inserting data into Student table
INSERT INTO Std (student_id, student_name, gender, dept_id)
VALUES
    (1, 'Jack', 'M', 1),
    (2, 'Jane', 'F', 1),
    (3, 'Mark', 'M', 2);

-- Final Query
SELECT d.dept_name AS dept_name, COUNT(s.student_id) AS student_number
FROM Department d
LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY student_number DESC, d.dept_name;
############################################################################

show databases;

use assignment;

show tables;

-- Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);

-- Insert data into Department table
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Science'),
(3, 'Law');

-- Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    gender VARCHAR(1),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert data into Student table
INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);


SELECT d.dept_name AS department_name,
       COUNT(s.student_id) AS student_number
FROM Department d
LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY student_number DESC, department_name;

#########################################################

-- Create Product table
CREATE TABLE Productt (
    product_key INT PRIMARY KEY
);

-- Insert data into Product table
INSERT INTO Productt (product_key) VALUES
(5),
(6);

-- Create Customer table
CREATE TABLE Customerr (
    customer_id INT,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product(product_key)
);

-- Insert data into Customer table
INSERT INTO Customerr (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

SELECT DISTINCT c.customer_id
FROM Customer c
WHERE NOT EXISTS (
    SELECT p.product_key
    FROM Product p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Customer c2
        WHERE c2.customer_id = c.customer_id AND c2.product_key = p.product_key
    )
);


#############################################################################################


show databases;

use assignment;

show tables;

-- Create Product table
CREATE TABLE Producttt (
    product_key INT PRIMARY KEY
);

-- Insert data into Product table
INSERT INTO Producttt (product_key) VALUES
(5),
(6);

-- Create Customer table
CREATE TABLE Customerrr (
    customer_id INT,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Producttt(product_key)
);

-- Insert data into Customer table
INSERT INTO Customerrr (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

SELECT DISTINCT c.customer_id
FROM Customerrr c
WHERE NOT EXISTS (
    SELECT p.product_key
    FROM Producttt p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Customerrr c2
        WHERE c2.customer_id = c.customer_id AND c2.product_key = p.product_key
    )
);

############################################

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT
);

-- Insert data into Employee table
INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 3),
(4, 'Doe', 2);

-- Create Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Insert data into Project table
INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

WITH RankedEmployees AS (
    SELECT
        p.project_id,
        p.employee_id,
        e.experience_years,
        RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS experience_rank
    FROM Project p
    JOIN Employee e ON p.employee_id = e.employee_id
)

SELECT project_id, employee_id
FROM RankedEmployees
WHERE experience_rank = 1;

##########################################################

-- Create Books table
CREATE TABLE Bookss (
    book_id INT PRIMARY KEY,
    name VARCHAR(255),
    available_from DATE
);

-- Insert data into Books table
INSERT INTO Bookss (book_id, name, available_from) VALUES
(1, 'Kalila And Demna', '2010-01-01'),
(2, '28 Letters', '2012-05-12'),
(3, 'The Hobbit', '2019-06-10'),
(4, '13 Reasons Why', '2019-06-01'),
(5, 'The Hunger Games', '2008-09-21');

-- Create Orders table
CREATE TABLE Orderss (
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    dispatch_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert data into Orders table
INSERT INTO Orderss (order_id, book_id, quantity, dispatch_date) VALUES
(1, 1, 2, '2018-07-26'),
(2, 1, 1, '2018-11-05'),
(3, 3, 8, '2019-06-11'),
(4, 4, 6, '2019-06-05'),
(5, 4, 5, '2019-06-20'),
(6, 5, 9, '2009-02-02'),
(7, 5, 8, '2010-04-13');


WITH BookSales AS (
    SELECT
        b.book_id,
        b.name,
        SUM(o.quantity) AS total_sold
    FROM Bookss b
    LEFT JOIN Orderss o ON b.book_id = o.book_id
    WHERE
        o.dispatch_date >= DATE_SUB('2019-06-23', INTERVAL 1 YEAR)
        AND b.available_from <= DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
    GROUP BY b.book_id, b.name
)

SELECT book_id, name
FROM BookSales
WHERE total_sold < 10 OR total_sold IS NULL;





############################################################################################


-- Create Teams table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255)
);

-- Insert data into Teams table
INSERT INTO Teams (team_id, team_name) VALUES
(1, 'Team A'),
(2, 'Team B'),
(3, 'Team C');

-- Create Matches table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    host_team INT,
    guest_team INT,
    host_goals INT,
    guest_goals INT,
    first_player INT,
    second_player INT,
    FOREIGN KEY (host_team) REFERENCES Teams(team_id),
    FOREIGN KEY (guest_team) REFERENCES Teams(team_id)
);

-- Insert data into Matches table
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals, first_player, second_player) VALUES
(1, 1, 3, 3, 0, 15, 45),
(2, 1, 2, 1, 2, 30, 25),
(3, 1, 3, 2, 0, 30, 15),
(4, 3, 2, 5, 2, 40, 20),
(5, 2, 3, 1, 1, 35, 50);

WITH MatchResults AS (
    SELECT
        m.match_id,
        m.host_team AS team_id,
        p1.player_id,
        m.host_goals AS goals_scored,
        ROW_NUMBER() OVER (PARTITION BY m.host_team ORDER BY m.host_goals DESC, p1.player_id ASC) AS rn
    FROM Matches m
    JOIN Players p1 ON m.first_player = p1.player_id

    UNION ALL

    SELECT
        m.match_id,
        m.guest_team AS team_id,
        p2.player_id,
        m.guest_goals AS goals_scored,
        ROW_NUMBER() OVER (PARTITION BY m.guest_team ORDER BY m.guest_goals DESC, p2.player_id ASC) AS rn
    FROM Matches m
    JOIN Players p2 ON m.second_player = p2.player_id
)

SELECT
    team_id AS group_id,
    player_id
FROM MatchResults
WHERE rn = 1;

###############################################################################################################

#######set-2 questions from 51

create database assignment2;

show databases;

use assignment2;

show tables;
-- Create World table
CREATE TABLE World (
    name VARCHAR(255) PRIMARY KEY,
    continent VARCHAR(255),
    area INT,
    population INT,
    gdp INT
);

-- Insert data into World table
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;


##########################################################################

-- Create Customer table
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    referee_id INT,
    FOREIGN KEY (referee_id) REFERENCES Customer(id)
);

-- Insert data into Customer table
INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;

########################################################

-- Create Customers table
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Create Orders table
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

-- Insert data into Orders table
INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);


SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

###############################################

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    team_id INT
);

-- Insert data into Employee table
INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

SELECT
    e.employee_id,
    e.team_id,
    COUNT(*) AS team_size
FROM
    Employee e
JOIN
    Employee e2 ON e.team_id = e2.team_id
GROUP BY
    e.employee_id, e.team_id;
    
###########################################################33

-- Create Person table
CREATE TABLE Person (
    Id INT PRIMARY KEY,
    name VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Insert data into Person table
INSERT INTO Person (Id, name, phone_number) VALUES
(3, 'Jonathan', '051-1234567'),
(12, 'Elvis', '051-7654321'),
(1, 'Moncef', '212-1234567'),
(2, 'Maroua', '212-6523651'),
(7, 'Meir', '972-1234567'),
(9, 'Rachel', '972-0011100');

-- Create Country table
CREATE TABLE Country (
    Name VARCHAR(255),
    country_code VARCHAR(3) PRIMARY KEY
);

-- Insert data into Country table
INSERT INTO Country (Name, country_code) VALUES
('Peru', '51'),
('Israel', '972'),
('Morocco', '212'),
('Germany', '49'),
('Ethiopia', '251');

-- Create Calls table
CREATE TABLE Calls (
    caller_id INT,
    callee_id INT,
    Duration INT
);

-- Insert data into Calls table
INSERT INTO Calls (caller_id, callee_id, Duration) VALUES
(1, 9, 33),
(2, 9, 4),
(1, 2, 59),
(3, 12, 102),
(3, 12, 330),
(12, 3, 5),
(7, 9, 13),
(7, 1, 3),
(9, 7, 1),
(1, 7, 7);

WITH CountryAverages AS (
    SELECT
        c.country_code,
        AVG(Duration) AS avg_call_duration
    FROM
        Calls c
    JOIN
        Person p1 ON c.caller_id = p1.id
    JOIN
        Person p2 ON c.callee_id = p2.id
    JOIN
        Country cc ON SUBSTRING(p1.phone_number, 1, 3) = cc.country_code
    GROUP BY
        cc.country_code
)

SELECT
    c.Name AS country
FROM
    Country c
JOIN
    CountryAverages ca ON c.country_code = ca.country_code
WHERE
    ca.avg_call_duration > (SELECT AVG(Duration) FROM Calls);
    
##############################################################################33

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);


WITH FirstLogin AS (
    SELECT
        player_id,
        device_id,
        event_date,
        RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS rnk
    FROM
        Activity
)

SELECT
    player_id,
    device_id
FROM
    FirstLogin
WHERE
    rnk = 1;


####################################################

-- Create Orders table
CREATE TABLE Orderss (
    order_number INT PRIMARY KEY,
    customer_number INT
);

-- Insert data into Orders table
INSERT INTO Orderss (order_number, customer_number) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

SELECT customer_number
FROM Orderss
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

########################################################

-- Create Cinema table
CREATE TABLE Cinema (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    Free BOOL
);

-- Insert data into Cinema table
INSERT INTO Cinema (Free) VALUES
(1),
(0),
(1),
(1),
(1);

-- Query to find consecutive available seats
SELECT seat_id
FROM (
    SELECT
        seat_id,
        Free,
        ROW_NUMBER() OVER (ORDER BY seat_id) -
        ROW_NUMBER() OVER (PARTITION BY Free ORDER BY seat_id) AS grp
    FROM Cinema
) AS grouped
WHERE Free = 1
GROUP BY seat_id, grp
HAVING COUNT(*) >= 3
ORDER BY seat_id;

############################################################################

show tables in assignment2;


-- Create SalesPerson table
CREATE TABLE SalesPerson1 (
    sales_id INT PRIMARY KEY,
    Name VARCHAR(255),
    salary INT,
    commission_rate INT,
    hire_date DATE
);

-- Insert data into SalesPerson table
INSERT INTO SalesPerson1 (sales_id, Name, salary, commission_rate, hire_date) VALUES
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 12000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 5000, 10, '2007-02-03');

-- Create Company table
CREATE TABLE Company1 (
    com_id INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255)
);

-- Insert data into Company table
INSERT INTO Company1 (com_id, Name, City) VALUES
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');

-- Create Orders table
CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    com_id INT,
    sales_id INT,
    amount INT
);

-- Insert data into Orders table
INSERT INTO Orders1 (order_id, order_date, com_id, sales_id, amount) VALUES
(1, '2014-01-01', 3, 4, 10000),
(2, '2014-02-01', 4, 5, 5000),
(3, '2014-03-01', 1, 1, 50000),
(4, '2014-04-01', 1, 4, 25000);

-- Query to find salespersons without orders related to the company with the name "RED"
SELECT DISTINCT SP.Name
FROM SalesPerson1 SP
LEFT JOIN Orders O ON SP.sales_id = O.sales_id
LEFT JOIN Company C ON O.com_id = C.com_id
WHERE C.Name <> 'RED' OR C.Name IS NULL;

######################################################################################
show tables in assignment2;

use assignment2;
-- Create Triangle table
CREATE TABLE Triangle (
    X INT,
    Y INT,
    Z INT,
    PRIMARY KEY (X, Y, Z)
);

-- Insert data into Triangle table
INSERT INTO Triangle (X, Y, Z) VALUES
(13, 15, 30),
(10, 20, 15);

-- Query to check if the line segments can form a triangle
SELECT X, Y, Z,
    CASE
        WHEN X + Y > Z AND X + Z > Y AND Y + Z > X THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;

########################################

-- Create Point table
CREATE TABLE Point (
    X INT PRIMARY KEY
);

-- Insert data into Point table
INSERT INTO Point (X) VALUES
(-1),
(0),
(2);

-- Query to find the shortest distance between any two points
SELECT MIN(ABS(p1.X - p2.X)) AS shortest
FROM Point p1
CROSS JOIN Point p2
WHERE p1.X <> p2.X;

-- Optimized query for ascending order
SELECT MIN(X - LAG(X) OVER (ORDER BY X)) AS shortest
FROM Point;

#########################################################

-- Create ActorDirector table
CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT,
    PRIMARY KEY (timestamp)
);

-- Insert data into ActorDirector table
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);

-- Query to find pairs where actor has cooperated with director at least three times
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;


#####################################################
-- Create Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);

-- Insert data into Product table
INSERT INTO Product (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

-- Create Sales table
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert data into Sales table
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

-- Query to report product_name, year, and price for each sale_id
SELECT P.product_name, S.year, S.price
FROM Sales S
JOIN Product P ON S.product_id = P.product_id;


#############################################################################

-- Create Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT
);

-- Insert data into Employee table
INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);

-- Create Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Insert data into Project table
INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

-- Query to report average experience years for each project
SELECT
    project_id,
    ROUND(AVG(experience_years), 2) AS average_years
FROM Project P
JOIN Employee E ON P.employee_id = E.employee_id
GROUP BY project_id;


#########################################################################

show tables in assignment2;

WITH SellerTotalSales AS (
    SELECT
        seller_id,
        SUM(price) AS total_sales
    FROM Sales
    GROUP BY seller_id
)

SELECT
    seller_id
FROM SellerTotalSales
WHERE total_sales = (SELECT MAX(total_sales) FROM SellerTotalSales);

###################################################################################

-- Query to report buyers who bought S8 but not iPhone
SELECT DISTINCT buyer_id
FROM Sales
WHERE product_id = (SELECT product_id FROM Product WHERE product_name = 'S8')
  AND buyer_id NOT IN (SELECT buyer_id FROM Sales WHERE product_id = (SELECT product_id FROM Product WHERE product_name = 'iPhone'));

show tables in assignment2;


##################################

show tables in assignment2;

-- Creating Salary table
CREATE TABLE Salary (
    id INT PRIMARY KEY,
    employee_id INT,
    amount INT,
    pay_date DATE
);

-- Inserting data into Salary table
INSERT INTO Salary VALUES (1, 1, 9000, '2017-03-31');
INSERT INTO Salary VALUES (2, 2, 6000, '2017-03-31');
INSERT INTO Salary VALUES (3, 3, 10000, '2017-03-31');
INSERT INTO Salary VALUES (4, 1, 7000, '2017-02-28');
INSERT INTO Salary VALUES (5, 2, 6000, '2017-02-28');
INSERT INTO Salary VALUES (6, 3, 8000, '2017-02-28');

-- Creating Employee table
CREATE TABLE Employee1 (
    employee_id INT PRIMARY KEY,
    department_id INT
);

-- Inserting data into Employee table
INSERT INTO Employee1 VALUES (1, 1);
INSERT INTO Employee1 VALUES (2, 2);
INSERT INTO Employee1 VALUES (3, 2);

-- Query to report the average salary comparison
WITH DepartmentAverage AS (
    SELECT
        department_id,
        AVG(amount) AS avg_salary
    FROM Salary
    GROUP BY department_id
),
CompanyAverage AS (
    SELECT AVG(amount) AS avg_salary FROM Salary
)
SELECT
    s.pay_date AS pay_month,
    e.department_id,
    CASE
        WHEN d.avg_salary > c.avg_salary THEN 'higher'
        WHEN d.avg_salary < c.avg_salary THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM
    Salary s
JOIN
    Employee1 e ON s.employee_id = e.employee_id
JOIN
    DepartmentAverage d ON e.department_id = d.department_id
CROSS JOIN
    CompanyAverage c;


#######################################################################

show tables in assignment2;

-- Creating Players table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    group_id INT
);

-- Creating Matches table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    first_player INT,
    second_player INT,
    first_score INT,
    second_score INT
);

-- Inserting data into Players table
INSERT INTO Players VALUES (15, 1);
INSERT INTO Players VALUES (25, 1);
INSERT INTO Players VALUES (30, 1);
INSERT INTO Players VALUES (45, 1);
INSERT INTO Players VALUES (10, 2);
INSERT INTO Players VALUES (35, 2);
INSERT INTO Players VALUES (50, 2);
INSERT INTO Players VALUES (20, 3);
INSERT INTO Players VALUES (40, 3);

-- Inserting data into Matches table
INSERT INTO Matches VALUES (1, 15, 45, 3, 0);
INSERT INTO Matches VALUES (2, 30, 25, 1, 2);
INSERT INTO Matches VALUES (3, 30, 15, 2, 0);
INSERT INTO Matches VALUES (4, 40, 20, 5, 2);
INSERT INTO Matches VALUES (5, 35, 50, 1, 1);

-- Query to find the winner in each group
WITH MatchResults AS (
    SELECT
        m.match_id,
        p.group_id,
        CASE
            WHEN m.first_score > m.second_score THEN m.first_player
            WHEN m.first_score < m.second_score THEN m.second_player
            ELSE LEAST(m.first_player, m.second_player)
        END AS winner
    FROM
        Matches m
        JOIN Players p ON m.first_player = p.player_id
)
SELECT
    group_id,
    winner AS player_id
FROM
    MatchResults
GROUP BY
    group_id;


################################################################################################


-- Creating Student table
CREATE TABLE Student1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

-- Creating Exam table
CREATE TABLE Exam1 (
    exam_id INT,
    student_id INT,
    score INT,
    PRIMARY KEY (exam_id, student_id)
);

-- Inserting data into Student table
INSERT INTO Student1 VALUES (1, 'Daniel');
INSERT INTO Student1 VALUES (2, 'Jade');
INSERT INTO Student1 VALUES (3, 'Stella');
INSERT INTO Student1 VALUES (4, 'Jonathan');
INSERT INTO Student1 VALUES (5, 'Will');

-- Inserting data into Exam table
INSERT INTO Exam1 VALUES (10, 1, 70);
INSERT INTO Exam1 VALUES (10, 2, 80);
INSERT INTO Exam1 VALUES (10, 3, 90);
INSERT INTO Exam1 VALUES (20, 1, 80);
INSERT INTO Exam1 VALUES (30, 1, 70);
INSERT INTO Exam1 VALUES (30, 3, 80);
INSERT INTO Exam1 VALUES (30, 4, 90);
INSERT INTO Exam1 VALUES (40, 1, 60);
INSERT INTO Exam1 VALUES (40, 2, 70);
INSERT INTO Exam1 VALUES (40, 4, 80);

-- Query to find quiet students in all exams
WITH ExamMinMax AS (
    SELECT
        exam_id,
        MIN(score) AS min_score,
        MAX(score) AS max_score
    FROM
        Exam1
    GROUP BY
        exam_id
)
SELECT
    s.student_id,
    s.student_name
FROM
    Student1 s
    JOIN Exam1 e ON s.student_id = e.student_id
    JOIN ExamMinMax emm ON e.exam_id = emm.exam_id
WHERE
    e.score != emm.min_score
    AND e.score != emm.max_score
GROUP BY
    s.student_id, s.student_name
HAVING
    COUNT(e.exam_id) = (SELECT COUNT(DISTINCT exam_id) FROM ExamMinMax);

####################################################################################

-- Creating activities table
CREATE TABLE activities (
    activity_id INTEGER,
    user_id INTEGER,
    activity_type VARCHAR(255),
    time_spent FLOAT,
    activity_date DATETIME
);

-- Creating age_breakdown table
CREATE TABLE age_breakdown (
    user_id INTEGER,
    age_bucket VARCHAR(255)
);

-- Inserting data into activities table
INSERT INTO activities VALUES (7274, 123, 'Open', 4.50, '2022-06-22 12:00:00');
INSERT INTO activities VALUES (2425, 123, 'Send', 3.50, '2022-06-22 12:00:00');
INSERT INTO activities VALUES (1413, 456, 'Send', 5.67, '2022-06-23 12:00:00');
INSERT INTO activities VALUES (1414, 789, 'Chat', 11.00, '2022-06-25 12:00:00');
INSERT INTO activities VALUES (2536, 456, 'Open', 3.00, '2022-06-25 12:00:00');

-- Inserting data into age_breakdown table
INSERT INTO age_breakdown VALUES (123, '31-35');
INSERT INTO age_breakdown VALUES (456, '26-30');
INSERT INTO age_breakdown VALUES (789, '21-25');

-- Query to obtain a breakdown of the time spent sending vs. opening snaps for each age group
SELECT
    ab.age_bucket,
    ROUND(SUM(CASE WHEN a.activity_type = 'Send' THEN a.time_spent ELSE 0 END) / SUM(a.time_spent) * 100.0, 2) AS send_perc,
    ROUND(SUM(CASE WHEN a.activity_type = 'Open' THEN a.time_spent ELSE 0 END) / SUM(a.time_spent) * 100.0, 2) AS open_perc
FROM
    age_breakdown ab
    JOIN activities a ON ab.user_id = a.user_id
GROUP BY
    ab.age_bucket;

##############################################################




























































































































































































































































































































































































































































































































    


























































































































































































































































(
    SELECT p.p_id, p.p_name
    FROM product p
    INNER JOIN sales s
    ON p.p_id = s.p_id
    WHERE s.sale_date >= 20190101 AND s.sale_date <= 20190331
)
EXCEPT
(
    SELECT p.p_id, p.p_name
    FROM product p
    INNER JOIN sales s
    ON p.p_id = s.p_id
    WHERE s.sale_date < 20190101 OR s.sale_date > 20190331
);

























































































































