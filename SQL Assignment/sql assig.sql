USE HR;
-- -----------------------------------------------------------------q1----------------------------------------------------------------------------------------------
-- . Display all information in the tables EMP and DEPT.  --
SELECT * 
FROM EMPLOYEES e
left join departments d
on e.department_id = d.department_id 
union
SELECT * 
FROM EMPLOYEES e
right join departments d
on e.department_id = d.department_id ;

--  Display only the hire date and employee name for each employee.--
SELECT HIRE_DATE, concat(FIRST_NAME, ' ', LAST_NAME) AS EMPLOYEE_NAME
FROM EMPLOYEES;

-- Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title --
select concat(first_name, ' , ',job_id) as employees_title
from employees ;


--  Display the hire date, name and department number for all clerks. --
SELECT HIRE_DATE, concat(FIRST_NAME, ' ', LAST_NAME) AS NAME_OF_EMPLOYEE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('PU_CLERK', 'ST_CLERK','SH_CLERK');

-- Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT --
select concat(first_name,',',
last_name,',',
email,',',
phone_number,',',
hire_date,',',
job_id,',',
salary,',',
commission_pct,',',
manager_id,',',
department_id) as output
from employees;


-- Display the names and salaries of all employees with a salary greater than 2000. --
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >2000;

-- Display the names and dates of employees with the column headers "Name" and "Start Date" --
SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS NAME, HIRE_DATE AS START_DATE
FROM EMPLOYEES;

-- Display the names and hire dates of all employees in the order they were hired --
SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE;

-- Display the names and salaries of all employees in reverse salary order. --
SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS NAME_OF_EMPLOYEE, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

--  Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 
SELECT concat(FIRST_NAME, ' ', LAST_NAME) AS ENAME, DEPARTMENT_ID AS DEPNO, COMMISSION_PCT, SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC;

-- Display the last name and job title of all employees who do not have a manager   --
SELECT E.LAST_NAME, J.JOB_TITLE, E.MANAGER_ID
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE MANAGER_ID IS NULL;

-- Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 --
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_REP', 'ST_CLERK')
AND SALARY NOT IN (2500, 3500, 5000);

---------------------------------------------------------------------------------------------------------------
-- 1 Display the maximum, minimum and average salary and commission earned. --  
select max(salary),min(salary),avg(salary)
from employees
where commission_pct is not null;

-- 2 Display the department number, total salary payout and total commission payout for each department.--
SELECT DEPARTMENT_ID, sum(SALARY) AS TOTAL_SALARY_PAYOUT, SUM(COMMISSION_PCT) AS TOTAL_COMMISSION_PAYOUT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

--  3 Display the department number and number of employees in each department.   --
SELECT DEPARTMENT_ID, count(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 4 Display the department number and total salary of employees in each department.   --
SELECT DEPARTMENT_ID, sum(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--  5 Display the employee's name who doesn't earn a commission. Order the result set without using the column name  --
select first_name
from employees
where commission_pct is  null
order by 1;

-- 6 Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately --
select first_name,department_id,commission_pct,
case
when commission_pct is null then 'no commission'
else commission_pct
end as commission_pct
from employees
;

-- 7 Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately  --
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
CASE
WHEN COMMISSION_PCT IS NOT  NULL THEN COMMISSION_PCT*2
ELSE COMMISSION_PCT
END AS COMMISSION_PCT1
FROM EMPLOYEES;

-- 8 Display the employee's name, department id who have the first name same as another employee in the same department  --
SELECT distinct E.FIRST_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN EMPLOYEES EM
ON E.FIRST_NAME = EM.FIRST_NAME
WHERE E.DEPARTMENT_ID = EM.DEPARTMENT_ID
AND E.EMPLOYEE_ID <> EM.EMPLOYEE_ID;

-- 9 Display the sum of salaries of the employees working under each Manager. --
SELECT MANAGER_ID, sum(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID; 

-- 10 Select the Managers name, the count of employees working under and the department ID of the manager.--
SELECT COUNT(E.EMPLOYEE_ID),E.DEPARTMENT_ID ,E.FIRST_NAME as manager_name,E.MANAGER_ID
FROM EMPLOYEES E
JOIN employeeS M
ON E.EMPLOYEE_id = M.MANAGER_ID
GROUP BY E.employee_ID , e.manager_id,e.first_name;

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! --
SELECT concat(E.FIRST_NAME, ' ', E.LAST_NAME) AS EMPLOYEE_NAME, E.DEPARTMENT_ID, E.SALARY, concat(M.FIRST_NAME, ' ', M.LAST_NAME) AS MANAGER_NAME
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.EMPLOYEE_ID = M.MANAGER_ID
WHERE E.LAST_NAME LIKE '_A%';

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. --
SELECT avg(SALARY) AS AVERAGE_SALARY, DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 13) Select the maximum salary of each department along with the department id  --
SELECT MAX(SALARY) AS MAX_SALARY, DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1 --
SELECT
CASE
WHEN COMMISSION_PCT IS NOT NULL THEN SALARY*0.10
ELSE 1
END AS COMMISSION_DISPLAY
FROM EMPLOYEES;

--------------------------------------------------------------------------------------------------------

-- 1. Write a query that displays the employee's last names onlY from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.  --
SELECT CONCAT(UPPER(SUBSTRING(LAST_NAME,2,1)),SUBSTRING(LAST_NAME,3,3)) AS STRING_NAME
FROM EMPLOYEES;

-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.  --
SELECT concat(FIRST_NAME, '_', LAST_NAME) AS EMPLOYEE_NAME, month(HIRE_DATE) AS JOINING_MONTH
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%' AND
LAST_NAME LIKE '%a%';

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.   --
SELECT LAST_NAME,
CASE
WHEN SALARY/2 > 10000 THEN SALARY*(1+0.10)
ELSE SALARY*(1+0.115)
END AS UPDATED_SALARY,
1500 AS 'BONUS AMOUNT'
FROM EMPLOYEES;

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$!   --
SELECT CONCAT(SUBSTRING(EMPLOYEE_ID, 1 ,2), '00', SUBSTRING(EMPLOYEE_ID,3,LENGTH(EMPLOYEE_ID)), 'E') AS  NEW_EMPLOYEE_ID, EMPLOYEE_ID, DEPARTMENT_ID, SALARY,
REPLACE(UPPER(FIRST_NAME), 'Z', '$') AS MANAGER_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT E.FIRST_NAME FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.EMPLOYEE_ID = M.MANAGER_ID);

SELECT CONCAT(SUBSTRING(M.EMPLOYEE_ID,1,2), '00', SUBSTRING(M.EMPLOYEE_ID,3)) AS NEW_EMPLOYEE_ID, M.DEPARTMENT_ID, M.SALARY, M.FIRST_NAME AS EMPLOYEE_NAME,
replace(UPPER(E.FIRST_NAME), 'Z', '$') AS MANGER_NAME
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.EMPLOYEE_ID = M.MANAGER_ID;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names  --
SELECT CONCAT(UPPER(SUBSTRING(LAST_NAME,1,1)), LOWER(SUBSTRING(LAST_NAME,2,LENGTH(LAST_NAME)))) AS NEW_LAST_NAME, length(LAST_NAME) AS NEW_LENGTH
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%j%' OR LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%m%'
ORDER BY LAST_NAME;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY   --
SELECT LAST_NAME, LPAD(SALARY, 15, '$') AS SALARY
FROM EMPLOYEES;

-- 7. Display the employee's name if it is a palindrome   --
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME = REVERSE (FIRST_NAME);

-- 8. Display First names of all employees with initcaps.   --
SELECT INITCAP(FIRST_NAME)
FROM EMPLOYEES;

SELECT CONCAT(UPPER(substring(FIRST_NAME,1,1)), LOWER(substring(FIRST_NAME,2))) AS FIRST_NAME_INITCAP
FROM EMPLOYEES;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.  --
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(STREET_ADDRESS, ' ', 2), ' ', -1) AS ADDRESS
FROM LOCATIONS;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.   --
SELECT FIRST_NAME, LOWER(concat(SUBSTRING(FIRST_NAME,1,1),LAST_NAME,'@systechusa.COM')) AS 'E-MAIL ADDRESS'
FROM  EMPLOYEES;

-- 11. Display the names and job titles of all employees with the same job as Trenna.   
SELECT E.FIRST_NAME, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME = 'TRENNA');

-- 12. Display the names and department name of all employees working in the same city as Trenna.  
 SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
 FROM EMPLOYEES E
 JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
 WHERE D.DEPARTMENT_ID =(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'TRENNA');
 
-- 13. Display the name of the employee whose salary is the lowest.   
SELECT FIRST_NAME, SALARY FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY)
FROM EMPLOYEES);

-- 14. Display the names of all employees except the lowest paid.
SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
FROM EMPLOYEES);

--------------------------------------------------------------------------------------------------------------------
-- 1. Write a query to display the last name, department number, department name for all employees.  --
SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. --
SELECT distinct JOB_TITLE, CITY
FROM JOBS J
JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.   --
SELECT E.LAST_NAME, D.DEPARTMENT_NAME,L.LOCATION_ID, L.CITY, E.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name  --
SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE LAST_NAME LIKE '%A%';

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.   --
SELECT E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'ATLANTA';

-- 6. Display the employee last name and employee number along with their manager's last name and manager number. --
SELECT M.LAST_NAME AS E_NAME, E.EMPLOYEE_ID, E.LAST_NAME AS M_NAME, M.MANAGER_ID
FROM EMPLOYEES E
JOIN EMPLOYEES M ON E.EMPLOYEE_ID = M.MANAGER_ID;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).   --
SELECT E.LAST_NAME AS E_NAME, E.EMPLOYEE_ID, M.LAST_NAME AS M_NAME, E.MANAGER_ID
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M ON M.EMPLOYEE_ID = E.MANAGER_ID;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. --
SELECT E.LAST_NAME, E.DEPARTMENT_ID, M.LAST_NAME
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.DEPARTMENT_ID = M.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = 102 AND E.EMPLOYEE_ID <> M.EMPLOYEE_ID;

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees.  Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)   --
SELECT E.FIRST_NAME, E.JOB_ID, D.DEPARTMENT_NAME, E.SALARY,
CASE
WHEN SALARY >=50000 THEN 'A'
WHEN SALARY >=30000 THEN 'B'
WHEN SALARY <30000 THEN 'C'
END AS GRADE
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date --
SELECT E.FIRST_NAME AS EMPLOYEE_NAME, E.HIRE_DATE AS EMP_HIRE_DATE, M.FIRST_NAME AS MANAGER_NAME, M.HIRE_DATE AS MAN_HIRE_DATE
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID
Where E.HIRE_DATE < M.HIRE_DATE;

------------------------------------------------------------------------------------------------------------------------
-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.   --
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_REP', 'SA_MAN');

SELECT E.LAST_NAME, E.HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'Sales';

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.   --
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES)
ORDER BY SALARY;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u   --
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%A%' OR Last_name like '%U%';

-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.--
SELECT E.LAST_NAME, D.DEPARTMENT_ID, E.JOB_ID, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID =D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'ATLANTA';

-- 5. Display the last name and salary of every employee who reports to FILLMORE.  --
SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON M.EMPLOYEE_ID = E.MANAGER_ID
WHERE M.FIRST_NAME = 'FILLMORE';

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.  --
SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 200;

SELECT E.DEPARTMENT_ID,E.LAST_NAME,E.JOB_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'OPERATIONS';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.   --
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
AND LAST_NAME LIKE '%U%'
ORDER BY SALARY;

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.  --
SELECT E.FIRST_NAME, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J 
ON E.JOB_ID = J.JOB_ID
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'Sales';

-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.--
SELECT EMPLOYEE_ID, SALARY,
CASE
WHEN DEPARTMENT_ID IN (1, 3) THEN SALARY*(1+0.05)
WHEN DEPARTMENT_ID = 2 THEN SALARY*(1+0.10)
WHEN DEPARTMENT_ID IN (4,5) THEN SALARY*(1+0.15)
WHEN DEPARTMENT_ID = 6 THEN 'NO RAISE'
END AS NEW_SALARY
FROM EMPLOYEES;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.  --
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC 
LIMIT 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column  --
SELECT FIRST_NAME,SALARY,
CASE
WHEN COMMISSION_PCT IS NULL THEN '0'
ELSE SALARY*COMMISSION_PCT
END AS COMMISSION_EARNED
FROM EMPLOYEES;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.--
SELECT distinct E.FIRST_NAME AS MANAGER_NAME, E.SALARY, E.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.EMPLOYEE_ID = M.MANAGER_ID
ORDER BY SALARY DESC
LIMIT 3;

--------------------------------------------------------------------------------------------------------
-- 1) Find the date difference between the hire date and resignation_date for all the employees. Display in no. of days, months and year(1 year 3 months 5 days). Emp_ID Hire Date Resignation_Date--
SELECT EMPLOYEE_ID, START_DATE, END_DATE, 
timestampdiff(DAY, START_DATE, END_DATE) AS TOTAL_DAYS,
concat(timestampdiff(YEAR,START_DATE, END_DATE) , ' YEAR ', 
floor(TIMESTAMPDIFF(DAY, START_DATE, END_DATE)%365 / 30), ' MONTH ' ,
FLOOR(timestampdiff(DAY, START_DATE, END_DATE)%365 %30), ' DAYS ' ) AS DIFFERNCE 
FROM JOB_HISTORY;

-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)  --
SELECT EMPLOYEE_ID, date_format(START_DATE, '%m/%d/%Y') AS HIRE_DATE,
CASE
WHEN END_DATE IS NOT NULL THEN date_format(END_DATE,'%M %D, %Y') 
ELSE 'DEC, 01th 1900'
END AS RESIGNATION_DATE
FROM JOB_HISTORY;

-- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)  -- 
SELECT EMPLOYEE_ID,
concat(FLOOR(TIMESTAMPDIFF(DAY, START_DATE, CURDATE())/365), ' YEAR AND ',
FLOOR (TIMESTAMPDIFF(DAY, START_DATE, CURDATE())%365/30), ' MONTHS') AS EXPERIENCE
FROM JOB_HISTORY;

-- 4) Display the count of days in the previous quarter  --
SELECT DATEDIFF(
LAST_DAY(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) QUARTER)),
DATE_ADD(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL (QUARTER(CURDATE()) +1) QUARTER)), INTERVAL 1 DAY)
) + 1 AS DAYS_IN_PREVIOUS_QUARTER;

-- 5) Fetch the previous Quarter's second week's first day's date   --
SELECT DATE_ADD(
DATE_SUB(LAST_DAY(DATE_SUB(curdate(), INTERVAL QUARTER(curdate()) QUARTER)), INTERVAL 1 MONTH),
INTERVAL 7 day
) AS FIRST_DAY_2ND_WEEK_PREVIOUS_QUARTER;

-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)--
SELECT
	DATE_FORMAT(DATE_ADD(FINANCIAL_YEAR_START, INTERVAL (15 -1)* 7 DAY), '%a %d %Y') AS START_OF_15TH_WEEK,
    DATE_FORMAT(DATE_ADD(FINANCIAL_YEAR_START, INTERVAL 15 * 7 -1 DAY), '%a %d %Y') AS END_OF_15TH_WEEK
    FROM 
(
		SELECT IF(MONTH(CURDATE()) >=4,
				MAKEDATE(YEAR(CURDATE()), 91),
                MAKEDATE(YEAR(CURDATE()) -1, 91)) AS FINANCIAL_YEAR_START
 ) AS FINANCIAL_YEAR;
 
 -- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with clause.  --
 WITH JANUARY_2015 AS (
 SELECT '2015-01-31' AS LAST_DAY_JANUARY
 )
 SELECT
	DATE_SUB(LAST_DAY_JANUARY, INTERVAL WEEKDAY(LAST_DAY_JANUARY) +1 DAY) AS LAST_SATURDAY
FROM JANUARY_2015;
    