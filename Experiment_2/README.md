Experiment: Advanced Data Aggregation and filtering

1. Aim of the Session

The aim of this lab session was to understand and implement SQL SELECT queries using clauses such as WHERE, ORDER BY, GROUP BY, and HAVING to efficiently retrieve and manipulate data from relational database tables.

2. Software Requirements
●	Database:
		○	Oracle Database Express Edition (Oracle XE)
		○	PostgreSQL Database (PgAdmin)

3. Objective of the Session

By the end of the session, the following objectives were achieved:

•	To practice writing SQL SELECT statements.

•	To apply filtering conditions using the WHERE clause.

•	To sort query results using the ORDER BY clause.

•	To group records using the GROUP BY clause.

•	To filter grouped data using the HAVING clause.

•	To analyze data using aggregate functions like COUNT(), SUM(), AVG(), MIN(), and MAX().


4. Practical / Experiment Steps

The experiment was carried out through the following activities:

1.	Schema Design: Created the EMPLOYEE table with constraints (PRIMARY KEY, NOT NULL, CHECK).

2.	Data Insertion: Inserted sample employee records into the table.

3.	Basic Retrieval: Displayed all records using SELECT *.

4.	Aggregate Analysis: Applied GROUP BY to calculate average salaries per department.

5.	Conditional Filtering: Used WHERE to filter employees with salary greater than 20,000.

6.	Grouped Filtering: Applied HAVING to restrict results to departments with average salary above 30,000.

7.	Sorting: Ordered results in descending order of average salary using ORDER BY.



5 . Procedure of the Practical
Execution was performed in the following order:
1.	Environment Setup: Logged into DBMS interface and accessed the server instance.
2.	Database Setup: Created a dedicated database for the library system.
3.	Schema Execution: Executed CREATE TABLE commands ensuring parent tables were defined first.
4.	Data Entry Phase: Inserted multiple employee records across IT, HR, and Finance departments.
5.	Verification Queries:  Verified data using SELECT queries
6.	.Executed queries step by step:

      •	Step 1: Grouped salaries by department.
      
      •	Step 2: Applied WHERE clause to filter salaries > 20,000.
      
      •	Step 3: Applied HAVING clause to restrict average salary > 30,000.
      
      •	Step 4: Ordered results in descending order of average salary.

7.	Documentation: Saved final SQL script and captured outputs for reporting.

6 . I/O Analysis (Input / Output Analysis)

Input Queries

SQL

CREATE TABLE EMPLOYEE(
	
  EMP_ID INT PRIMARY KEY,
	
  EMP_NAME VARCHAR(30) NOT NULL,
	
  DEPARTMENT VARCHAR(30) NOT NULL,
	
  SALARY INT CHECK(SALARY>0) NOT NULL,
	
  JOINING_DATE DATE NOT NULL

)

SELECT * FROM EMPLOYEE

INSERT INTO EMPLOYEE 

VALUES(101,'KRRISH','IT',47850,'01-08-2022')

INSERT INTO EMPLOYEE

VALUES(102,'NISHANT','HR',37000,'01-01-2024')

INSERT INTO EMPLOYEE

VALUES(103,'ROHIT','FINANCE',18000,'15-04-2025')

INSERT INTO EMPLOYEE 

VALUES(104,'LAKSHAY','IT',27850,'01-09-2024')

INSERT INTO EMPLOYEE

VALUES(105,'ARYA','HR',28000,'05-11-2021')

INSERT INTO EMPLOYEE

VALUES(106,'HARSH','FINANCE',16000,'21-07-2023')

INSERT INTO EMPLOYEE

VALUES(107,'SHIVAM','IT',24000,'20-11-2020')

INSERT INTO EMPLOYEE

VALUES(108,'MANAV','FINANCE',21700,'14-11-2022')

INSERT INTO EMPLOYEE

VALUES(109,'VIPUL','HR',31700,'10-10-2025')


SELECT * FROM EMPLOYEE

--STEP 1

SELECT DEPARTMENT,AVG(SALARY)::NUMERIC(10,2) AS AVG_SALARY 

FROM EMPLOYEE

GROUP BY DEPARTMENT

--STEP 2

SELECT DEPARTMENT,AVG(SALARY)::NUMERIC(10,2) AS AVG_SALARY 

FROM EMPLOYEE

WHERE SALARY>20000

GROUP BY DEPARTMENT


--STEP 3

SELECT DEPARTMENT,AVG(SALARY)::NUMERIC(10,2) AS AVG_SALARY 

FROM EMPLOYEE

WHERE SALARY>20000

GROUP BY DEPARTMENT

HAVING AVG(SALARY)>30000


--STEP 4

SELECT DEPARTMENT,AVG(SALARY)::NUMERIC(10,2) AS AVG_SALARY 

FROM EMPLOYEE

WHERE SALARY>20000

GROUP BY DEPARTMENT

HAVING AVG(SALARY)>30000

ORDER BY AVG(SALARY) DESC


Output Details

1. Schema Creation

•	EMPLOYEE table created successfully with constraints.

•	CHECK(SALARY > 0) ensured valid salary entries.

✔ Result: Schema creation completed without errors.

2. Data Insertion:

Records inserted for employees across IT, HR, and Finance departments.

<img width="975" height="414" alt="image" src="https://github.com/user-attachments/assets/722d56d6-d9d8-42fd-934a-02e2891198bf" />

  
3. Perfomed Stepwise Operations :

 Step 1 Output:

•	Displayed average salary per department.

<img width="622" height="283" alt="image" src="https://github.com/user-attachments/assets/cb218ca9-4a2f-4734-8a85-6ba8ef1d4ae7" />

 
Step 2 Output:

•	Filtered employees with salary > 20,000 before grouping.

<img width="661" height="217" alt="image" src="https://github.com/user-attachments/assets/6c349481-4347-416a-8e0d-968c65406a4f" />

 
Step 3 Output:

•	Displayed only departments with average salary > 30,000.

<img width="639" height="191" alt="image" src="https://github.com/user-attachments/assets/c4e0d588-2bee-4502-9235-5bef8be901cd" />

 
Step 4 Output:

•	Final result sorted in descending order of average salary.

<img width="639" height="191" alt="image" src="https://github.com/user-attachments/assets/f2d1684d-0ba2-4014-872e-182a10ccef72" />

 
7. Learning Outcome

From this practical, the following knowledge and skills were gained:

o	Learned how to filter records using the WHERE clause.

o	Understood grouping of records using GROUP BY.

o	Applied conditions on grouped data using HAVING.

o	Practiced sorting results using ORDER BY.
o	Gained insight into aggregate functions (COUNT, SUM, AVG, MIN, MAX) for data analysis.
