-- Employee Salary Analysis Project
-- SQL Portfolio Project

CREATE TABLE EMPLOYEES (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary INT,
    joining_date DATE,
    experience INT
);
-- Employee Salary Analysis
-- Project includes salary analysis, department analysis and SQL JOINs.
insert into EMPLOYEES values
(101,'AMIT','IT','DATA ANALYST',45000,'2022-01-15',3),
(102,'SHUBHAM','IT','DATA ANALYST',35000,'2025-12-10',1),
(103,'PRIYA','HR','HR EXECUTIVE',30000,'2023-03-10',2),
(104,'RAHUL','FINANCE','ACCOUNTANT',35000,'2021-06-20',4),
(105,'NEHA','IT','SOFTWARE DEVELOPER',60000,'2020-08-12',5),
(106,'ALKA','FINANCE','FINANCE ANAYLYST',35000,'2024-10-04',6),
(107,'KARAN','IT','DATA SCIENTIST',55000,'2021-11-25',4),
(108,'ANJALI','SALES','SALES MANAGER',48000,'2020-02-08',4),
(109,'ARJUN','SALES','SALES MANAGER',28000,'2021-11-25',6),
(110,'ROHIT','HR','HR EXECUTVE',42000,'2019-07-04',2),
(111,'VIKAS','IT','SOFTWARE DEVELOPER',65000,'2019-09-09',6),
(112,'MEENA','SALES','SALES EXECUTIVE',30000,'2022-12-01',3),
(113,'DEEPAK','FINANCE','FINANCE MANAGER',58000,'2018-04-22',7),
(114,'KAVITA','HR','HR EXECUTIVE',32000,'2022-06-11',3),
(115,'MANISH','IT','DATA ANALYST',47000,'2023-02-19',2);
-- 3. Employee Salary Analysis
CREATE TABLE DEPARTMENTS
(DEPARTNEMT_ID INT,
  DEPARTMENT_NAME VARCHAR(50),
  MANAGER_NAME VARCHAR(50));

INSERT INTO DEPARTMENTS valueS
(1,'IT','VIKAS'),
(2,'FINANCE','DEEPAK'),
(3,'HR','POOJA'),
(4,'SALES','ARJUN');
-- 3. Total number of employees
SELECT COUNT(*) FROM EMPLOYEES;

-- 4. Average salary
SELECT AVG(salary) FROM EMPLOYEES;

-- 5. Highest salary
SELECT MAX(salary) FROM EMPLOYEES;

-- 4. Average salary
SELECT AVG(salary) FROM SATFF;

-- 5. join query
select
e.employee_name,
e.salary,
d.department_name,
d.manager_name
from employees e 
inner join departments d 
on e.department=d.department_name
  where e.salary>40000 and d.department_name='IT';

select
e.employee_name,
e.salary,
d.department_name,
d.manager_name
from employees e 
inner join departments d 
on e.department=d.department_name
  where SALARY >(SELECT AVG(SALARY)FROM EMPLOYEES)
  ORDER BY SALARY DESC;

-- 6. MAX SALARY DEPARTMENT WISE
select
DEPARTMENT,
EMPLOYEE_NAME,
MAX(SALARY) AS MAX_SALARY,
FROM EMPLOYEES
GROUP BY DEPARTMENT,EMPLOYEE_NAME
ORDER BY MAX_SALARY DESC;

-- 7.MAX SALARY WITH DEPARTMENT
select
  e.employee_name,
  e.department,
  e.salary
  
from employees e 
inner join 
(select
DEPARTMENT,
MAX(SALARY) AS MAX_SALARY,
FROM EMPLOYEES
GROUP BY DEPARTMENT)m 
on e.department =m.department
  and e.salary =m.max_salary;
