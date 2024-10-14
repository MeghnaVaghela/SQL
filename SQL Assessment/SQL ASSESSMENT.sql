CREATE DATABASE ASSESSMENT;
USE ASSESSMENT;

-- ASSESSMENT 1 --

CREATE TABLE WORKER(WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR (50),
LAST_NAME VARCHAR (50),
SALARY BIGINT,
JOINING_DATE datetime,
DEPARTMENT VARCHAR (70));

INSERT INTO WORKER(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (1, 'MONIKA', 'ARORA', 100000, '2014-02-20 9:00', 'HR'),
(2, 'NIHARIKA', 'VERMA', 80000, '2014-06-11 9:00', 'ADMIN'),
(3, 'VISHAL', 'SINGHAL', 300000, '2014-02-20 9:00', 'HR'),
(4, 'AMITABH', 'SINGH', 500000, '2014-02-20 9:00', 'ADMIN'),
(5, 'VIVEK', 'BHATI', 500000, '2014-06-11 9:00', 'ADMIN'),
(6, 'VIPUL', 'DIWAN', 200000, '2014-06-11 9:00', 'ACCOUNT'),
(7, 'SATISH', 'KUMAR', 75000, '2014-01-20 9:00', 'ACCOUNT'),
(8, 'GEETIKA', 'CHAUHAN', 90000,'2014-04-11 9:00', 'ADMIN');

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. --
SELECT * 
FROM WORKER
ORDER BY DEPARTMENT DESC, FIRST_NAME;

-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. --
SELECT *
FROM WORKER
WHERE FIRST_NAME IN ('VIPUL' , 'SATISH');

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. --
SELECT * 
FROM WORKER
WHERE FIRST_NAME LIKE '_____H';

-- Write an SQL query to print details of the Workers whose SALARY lies between 1. --
SELECT *
FROM WORKER
WHERE SALARY < 100000;

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table--
SELECT FIRST_NAME, email, COUNT(*) as duplicate_count
FROM employees
GROUP BY FIRST_NAME, email
HAVING COUNT(*) > 1;

-- Write an SQL query to show the top 6 records of a table.--
SELECT *
FROM WORKER 
LIMIT 8;

-- Write an SQL query to fetch the departments that have less than five people in them. --
SELECT DEPARTMENT
FROM WORKER
GROUP BY DEPARTMENT
HAVING count(*) <5;

-- 8. Write an SQL query to show all departments along with the number of people in there. --
SELECT DEPARTMENT, count(*)
FROM WORKER
GROUP BY DEPARTMENT;

-- Write an SQL query to print the name of employees having the highest salary in each department. --
SELECT DEPARTMENT, max(SALARY) AS HIGHEST_SALARY
FROM WORKER
GROUP BY DEPARTMENT;

--------------------------------------------------------------------------------------------------------------------------------------------------
-- Question 2: Open school database, then select student table and use following SQL statements. TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT -- 

CREATE DATABASE SCHOOL;

USE SCHOOL;

CREATE TABLE STUDENT(ID INT PRIMARY KEY,
STDNAME VARCHAR (80),
SEX VARCHAR (20),
PERCENTAGE INT,
CLASS INT,
SEC VARCHAR (5),
STREAM varchar (25),
DOB DATE);

INSERT INTO STUDENT(ID, STDNAME, SEX, PERCENTAGE, CLASS, SEC, STREAM, DOB)
VALUES (1001, 'SUREKHA JOSHI', 'FEMALE', 82, 12, 'A', 'SCIENCE', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'FEMALE', 56, 11, 'C', 'COMMERCE', '2008-11-23'),
(1003, 'SANAM VERMA', 'MALE', 59, 11, 'C', 'COMMERCE', '2006-06-29'),
(1004, 'RONIT KUMAR', 'MALE', 63, 11, 'C', 'COMMERCE', '1997-11-05'),
(1005, 'DIPESH PULKIT', 'MALE', 78, 11, 'B', 'SCIENCE', '2003-09-14'),
(1006, 'JAHANVI PURI', 'FEMALE', 60, 11, 'B', 'COMMERCE', '2008-11-07'),
(1007, 'SANAM KUMAR', 'MALE', 23, 12, 'F', 'COMMERCE', '1998-03-08'),
(1008, 'SAHIL SARAS', 'MALE', 56, 11, 'C', 'COMMERCE', '2008-11-07'),
(1009, 'AKSHARA AGARWAL', 'FEMALE', 72, 12, 'B', 'COMMERCE', '1996-10-01'),
(1010, 'STUTI MISHRA', 'FEMALE', 39, 11, 'F', 'SCIENCE', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'MALE', 42, 11, 'C', 'SCIENCE', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'MALE', 49, 12, 'C', 'COMMERCE', '1998-06-28'),
(1013, 'AKRITI SAXSENA', 'FEMALE', 89, 12, 'A', 'SCIENCE','2008-11-23'),
(1014, 'TANI RASTOGII', 'FRMALE', 82, 12, 'A', 'SCIENCE', '2008-11-23'); 

-- To display all the records form STUDENT table.--
SELECT * 
FROM STUDENT;

-- To display any name and date of birth from the table STUDENT. --
SELECT STDNAME, DOB
FROM STUDENT;

-- To display all students record where percentage is greater of equal to 80 FROM student table. --
SELECT *
FROM STUDENT
WHERE PERCENTAGE >=80;

-- To display student name, stream and percentage where percentage of student is more than 80--
SELECT STDNAME, STREAM, PERCENTAGE
FROM STUDENT
WHERE PERCENTAGE >80;

-- To display all records of science students whose percentage is more than 75 form student table. --
SELECT *
FROM STUDENT
WHERE STREAM = 'SCIENCE' AND PERCENTAGE >75;