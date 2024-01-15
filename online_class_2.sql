-- Active: 1693122323779@@127.0.0.1@3306
show databases;

create database sunday;

show DATABASES;

use  sunday;

show tables from sunday;


create table customer_info(id int AUTO_INCREMENT PRIMARY KEY , firstname VARCHAR(25), lastname varchar(25), salary integer);


insert into customer_info() values (1,"shiva","sai",40000);

select * from customer_info;

insert into customer_info(firstname , lastname , salary ) values ("nishita","mallur",50000);


select * from customer_info;

CREATE TABLE c_info
  AS (SELECT * FROM customer_info);

select * from c_info;

drop table c_info;

insert into customer_info(firstname , lastname , salary ) values ("abs","bbq", 54000), ("babs","ccq", 67000);


select * from customer_info;

TRUNCATE TABLE customer_info;

insert into customer_info(id, firstname , lastname , salary ) values (1, "abs","bbq", 54000);

insert into customer_info(firstname , lastname , salary ) values ("quebec", 'montreal', 45000),("ontario","toronto", 55000);

select * from customer_info;

insert into customer_info( firstname , lastname , salary ) values ("krish","naik", NULL);

select * from customer_info;

desc customer_info;

select * from customer_info where salary is null;

update customer_info
set salary = 45000
where id = 3;

select * from customer_info;
## FIRST_constraint we will discuss is Not Null

Alter table customer_info
modify column salary float not null;

desc customer_info;

insert into customer_info( firstname , lastname , salary ) values ("ojas","gambira", NULL);


select * from customer_info;

## SECOND_constraint is  UNIQUE where you can combine multiple columns 

## difference between primary key (should be not null) and unique key (can be a null value) Also primary key should be 100% only 1 should be there in the table  and when it comes to be unique key it can be many


create table employee(
  id int PRIMARY KEY,
  firstname VARCHAR(25),
  lastname VARCHAR(25),
  H:NO int NULL,
  salary int not null
)

select * from employee;

insert into employee(id,firstname,lastname,salary) values(1,"ojas","gambira",12000);

truncate employee;

desc employee;


## changing the existing table column to unique  etc...

ALTER TABLE employee
ADD CONSTRAINT unique_h_no UNIQUE (H:NO);

desc employee;

select * from employee;

## To make a single column as UNIQUE

ALTER TABLE employee
ADD UNIQUE (lastname);

desc employee;

ALTER TABLE employee
ADD constraint comb_ln_H Unique(lastname,H);

desc employee;

select * from employee;

insert into employee(id,firstname,lastname,H:NO, salary) values(1,"krish","naik",470,12000);

select * from employee;

insert into employee(id,firstname,lastname,H:NO, salary) values(2,"krish1","naikk",470,12000);

## when executed above query got this error Duplicate entry '2' for key 'employee.PRIMARY' bcoz we merged lastname and H:no to be unique key and it doesnot accept the redundant VALUES as my h:no value 470 is same for both employees


##now to drop that combined column which is combination of lastname,H:no below the command is

Alter table employee
drop index comb_ln_H;

Alter table employee
drop index unique_h_no;

Alter table employee
drop index lastname;

select * from employee;

insert into employee(id,firstname,lastname,H:NO, salary) values(3,"krish1","naikk",470,12000), (4,"krish1","naikk",470,12000);

### next constraint is primary KEY

create table person(
id int not null,
first_name varchar(25),
last_name varchar(25),
Age int,
primary key(id)
);

desc person;
Alter table person
drop primary key;

ALTER TABLE person
ADD PRIMARY KEY (id);

desc person;


Alter table person 
add constraint pk_student primary key(id,last_name);

desc person;

insert into person values(1,"Krish","Naik",32),(2,"Krish","Naik",32);


select * from person;

create table orders(
orderid int not null,
ordernumber int not null,
id int,
primary key(orderid),
foreign key (id) references person(id)
);

insert into person values(3,"Krish","Naik",32);


insert into person values(4,"Krish1","Naik1",31),
(5,"Sunny","Savitha",30),(6,"Darius","Bengali",27);

select * from person;

insert into orders values(5,1,2),(2,3,4);
select * from orders;


select * from person as ps inner join orders as od
on ps.id=od.id; 

select * from person as ps left join orders as od
on ps.id=od.id; 

## inner join and right join giving same results...
select * from person as ps right join orders as od
on ps.id=od.id;

## left join and left outer join giving same results...
select * from person as ps left outer join orders as od
on ps.id=od.id;


#################################################################################################


create table customers(
id int auto_increment,
first_name varchar(25),
country varchar(25),
capital varchar(25),
primary key(id)
);




insert into customers(id,first_name,country,capital) values
(1,"Krish","India","Delhi"),
(2,"tom","Australia","Canberra"),
(3,"Sunny","Maldives","Male"),
(4,"Darius","India","Delhi");



select * from customers;

select * from customers where country="India" or country="Maldives";

select * from customers where country!="India";


select * from customers where not country='India';




create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int , 
housing varchar(30),
loan varchar(30) , 
contact varchar(30),
`day` int,
`month` varchar(30) , 
duration int , 
campaign int,
pdays int , 
previous int , 
poutcome varchar(30) , 
y varchar(30));




select * from bank_details;
insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(29,"management","single","tertiary","no",0,"yes","no","unknown",5,"may",363,1,-1,0,"unknown","no"),
(54,"blue-collar","married","secondary","no",1291,"yes","no","unknown",5,"may",266,1,-1,0,"unknown","no"),
(48,"management","divorced","tertiary","no",-244,"yes","no","unknown",5,"may",253,1,-1,0,"unknown","no"),
(32,"management","married","tertiary","no",0,"yes","no","unknown",5,"may",179,1,-1,0,"unknown","no"),
(42,"admin.","single","secondary","no",-76,"yes","no","unknown",5,"may",787,1,-1,0,"unknown","no"),
(24,"technician","single","secondary","no",-103,"yes","yes","unknown",5,"may",145,1,-1,0,"unknown","no"),
(38,"entrepreneur","single","tertiary","no",243,"no","yes","unknown",5,"may",174,1,-1,0,"unknown","no"),
(38,"management","single","tertiary","no",424,"yes","no","unknown",5,"may",104,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",306,"yes","no","unknown",5,"may",13,1,-1,0,"unknown","no"),
(40,"blue-collar","single","unknown","no",24,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(46,"services","married","primary","no",179,"yes","no","unknown",5,"may",1778,1,-1,0,"unknown","no"),
(32,"admin.","married","tertiary","no",0,"yes","no","unknown",5,"may",138,1,-1,0,"unknown","no"),
(53,"technician","divorced","secondary","no",989,"yes","no","unknown",5,"may",812,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",249,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",790,"yes","no","unknown",5,"may",391,1,-1,0,"unknown","no"),
(49,"blue-collar","married","unknown","no",154,"yes","no","unknown",5,"may",357,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",6530,"yes","no","unknown",5,"may",91,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",100,"no","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",59,"yes","no","unknown",5,"may",273,1,-1,0,"unknown","no"),
(55,"technician","married","secondary","no",1205,"yes","no","unknown",5,"may",158,2,-1,0,"unknown","no"),
(35,"blue-collar","single","secondary","no",12223,"yes","yes","unknown",5,"may",177,1,-1,0,"unknown","no"),
(57,"blue-collar","married","secondary","no",5935,"yes","yes","unknown",5,"may",258,1,-1,0,"unknown","no"),
(31,"services","married","secondary","no",25,"yes","yes","unknown",5,"may",172,1,-1,0,"unknown","no"),
(54,"management","married","secondary","no",282,"yes","yes","unknown",5,"may",154,1,-1,0,"unknown","no"),
(55,"blue-collar","married","primary","no",23,"yes","no","unknown",5,"may",291,1,-1,0,"unknown","no"),
(43,"technician","married","secondary","no",1937,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",384,"yes","no","unknown",5,"may",176,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",582,"no","yes","unknown",5,"may",211,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","no",91,"no","no","unknown",5,"may",349,1,-1,0,"unknown","no"),
(49,"services","divorced","secondary","no",0,"yes","yes","unknown",5,"may",272,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","yes",1,"yes","no","unknown",5,"may",208,1,-1,0,"unknown","no"),
(45,"admin.","single","secondary","no",206,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(47,"services","divorced","secondary","no",164,"no","no","unknown",5,"may",212,1,-1,0,"unknown","no"),
(42,"technician","single","secondary","no",690,"yes","no","unknown",5,"may",20,1,-1,0,"unknown","no"),
(59,"admin.","married","secondary","no",2343,"yes","no","unknown",5,"may",1042,1,-1,0,"unknown","yes"),
(46,"self-employed","married","tertiary","no",137,"yes","yes","unknown",5,"may",246,1,-1,0,"unknown","no"),
(51,"blue-collar","married","primary","no",173,"yes","no","unknown",5,"may",529,2,-1,0,"unknown","no"),
(56,"admin.","married","secondary","no",45,"no","no","unknown",5,"may",1467,1,-1,0,"unknown","yes"),
(41,"technician","married","secondary","no",1270,"yes","no","unknown",5,"may",1389,1,-1,0,"unknown","yes"),
(46,"management","divorced","secondary","no",16,"yes","yes","unknown",5,"may",188,2,-1,0,"unknown","no"),
(57,"retired","married","secondary","no",486,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(42,"management","single","secondary","no",50,"no","no","unknown",5,"may",48,1,-1,0,"unknown","no"),
(30,"technician","married","secondary","no",152,"yes","yes","unknown",5,"may",213,2,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",290,"yes","no","unknown",5,"may",583,1,-1,0,"unknown","no");



select * from bank_details where age>=30 and age<=35;

select * from bank_details;

select * from bank_details where education = "unknown"and marital = "single" and balance < 1000;

##with this data try to fine out sum of balance 

SELECT SUM(balance) AS total_balance FROM bank_details;

##Try to find out avarage of balance 
SELECT AVG(balance) AS average_balance FROM bank_details;

##try to find out who is having a min balance 

SELECT * FROM bank_details
WHERE balance = (SELECT MIN(balance) FROM bank_details);

##try to find out who is having a mazxmim balance 

SELECT * FROM bank_details
WHERE balance = (SELECT MAX(balance) FROM bank_details);

## top 5 high balance accounts
SELECT * FROM bank_details
ORDER BY balance DESC
LIMIT 5;


## top 5 low balance accounts
SELECT * FROM bank_details
ORDER BY balance 
LIMIT 5;

##try to prepare a list of all the person who is having loan 

select * from bank_details where loan = "yes";


##try to find out average balance for all the people whose job role is admin 

SELECT AVG(balance) AS average_balance
FROM bank_details
WHERE job = 'admin';


##try to find out a record  without job whose age is below 45 

SELECT *
FROM bank_details
WHERE (job IS NULL OR job = '') AND age < 45;

##try to find out a record where education is primarty and person is jobless

SELECT *
FROM bank_details
WHERE education = 'primary' AND (job IS NULL OR job = '');


SELECT * 
FROM bank_details;

##try to find of a record whose bank account is having a negative balance 
SELECT *
FROM bank_details
WHERE balance < 0;

##try to find our a record who is not having house at all along with there balance 
SELECT (balance)
FROM bank_details
WHERE housing = 'no';


#######################################################################################################################


## Stored procedures:- stored procedures is a collection of pre compiled sql statements
## functions
## triggers
## joins
## cte window functions


show databases;

create DATABASE krish;

use krish;
show databases;

create table student_info(
id int,
student_code varchar(30),
first_name varchar(25),
subjects varchar(30),
marks float
);


insert into student_info values(1,"100","Krish","Data Science",50),
(2,"102","Sunny","Machine Learning",70),
(3,"103","John","Physics",80),
(4,"104","Mary","Chemistry",90),
(5,"105","Virat","Cricket",100),
(6,"106","tony","Dhoni",70);


select * from student_info;


call ranked_student(85);


##indexes
create index idx_firstname
on student_info(first_name);

select * from student_info where first_name="Krish";

alter table student_info
drop index idx_firstname;

## Views

create view stud_basic_info as
select student_code,first_name
from student_info;

select * from stud_basic_info;

Select * from student_info;

alter table student_info
drop index idx_firstname;


##########      some examples assignments lets see  ##############

show databases;

create database linkedin;


use linkedin;




-- Create the AI_Tools table
CREATE TABLE AI_Tools (
  id INT NOT NULL,
  tech VARCHAR(25) NOT NULL
);

-- Insert data into the AI_Tools table
INSERT INTO AI_Tools (id, tech) VALUES
  (1, 'ds'),
  (1, 'tableau'),
  (1, 'sql'),
  (2, 'r'),
  (1, 'python'),
  (2, 'powerbi');

select * from AI_Tools;

truncate AI_Tools;

-- Select rows where id has the maximum count of tech
SELECT id
FROM AI_Tools
GROUP BY id
HAVING COUNT(tech) = (
  SELECT MAX(tech_count)
  FROM (
    SELECT id, COUNT(tech) AS tech_count
    FROM AI_Tools
    GROUP BY id
  ) AS temp
);

SELECT id, COUNT(tech) AS tech_count
    FROM AI_Tools
    GROUP BY id;

 SELECT MAX(tech_count)
  FROM (
    SELECT id, COUNT(tech) AS tech_count
    FROM AI_Tools
    GROUP BY id
  ) AS temp


##########      some examples assignments lets see  ##############

use assignment;




















































