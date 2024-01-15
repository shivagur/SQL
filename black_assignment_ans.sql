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


#################

show databases;

create database facebook;

use facebook;


create table ewebsite(
  pid int NOT NULL,
  pname varchar(25)
);

insert into ewebsite values(1001,"blog"),(1002,"youtube"),(1003,"education");

select * from ewebsite;

create table plikes(
  userid int NOT NULL,
  pid int NOT NULL,
  likeddate int NOT NULL
);

insert into plikes values(1,1001,19082023),(2,1003,18082023);


select * from plikes;


SELECT e.pid
FROM ewebsite e
LEFT JOIN plikes p ON e.pid = p.pid
WHERE p.pid IS NULL;

