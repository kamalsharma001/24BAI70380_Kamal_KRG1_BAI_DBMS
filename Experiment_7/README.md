Experiment: Design and Implementation of Materialized Views

1. Aim of the Session

To design and implement a materialized view and to compare and analyze execution time and performance differences between simple views, complex views, and materialized views, thereby understanding their impact on query optimization and system performance.

2. Software Requirements

●	Database:

○	Oracle live SQL
○	PostgreSQL Database (PgAdmin)

3. Objective of the Session

By the end of the session, the following objectives were achieved:

•	To create simple views, complex views, and materialized views.

•	To evaluate performance by comparing query execution time for each.

•	To highlight the advantages of materialized views in enterprise-level applications.

•	To understand how materialized views improve query optimization and system performance.

4. Practical / Experiment Steps

The experiment was carried out through the following activities:

•	Create tables with multiple records.

•	Create a simple view based on a single table.

•	Create a complex view involving joins, filters, or aggregations.

•	Create a materialized view storing precomputed query results.

•	Analyze and compare their execution time and performance.

•	Print results or apply business logic for each record.

•	Execute PL/SQL blocks and verify correctness of row-by-row processing.

•	Save PL/SQL scripts and outputs for reporting.

5. Procedure of the Practical

Execution was performed in the following order:

1.	Environment Setup: Logged into Oracle LIVE SQL Developer to prepare the workspace.

2.	Table Creation: Created EMPLOYEE and DEPARTMENT tables.

<img width="696" height="380" alt="image" src="https://github.com/user-attachments/assets/8a96ffc6-a925-4708-a571-b9a94517be15" />

 3.	Data Insertion: inserted of data in both tables.

 <img width="706" height="451" alt="image" src="https://github.com/user-attachments/assets/674b33b9-8db7-40f1-8346-db303378b42d" />

4.	Implementation of simple view on a single table.

<img width="608" height="294" alt="image" src="https://github.com/user-attachments/assets/b19f1df4-2ca8-4879-bc8d-21ab9408fb71" />

5.	Implementation of complex view with joins and aggregations.

 <img width="975" height="239" alt="image" src="https://github.com/user-attachments/assets/5ebd7ee4-dc69-4b7d-816d-7d1eb4ef1049" />

6.	Implementation of materialized view to store precomputed results.

 <img width="826" height="245" alt="image" src="https://github.com/user-attachments/assets/50edf5b4-b07a-4f74-8768-ba3eb90f7fd6" />

7.	Implementation of Performance Analysis

 <img width="939" height="203" alt="image" src="https://github.com/user-attachments/assets/fe66dc46-0caa-4f29-a27f-014273deebec" />

8.	Output Verification: Executed the block and verified the output for correctness.

9.	Documentation: Saved the SQL script and captured outputs for reporting and future reference.

6. I/O Analysis (Input / Output Analysis)

Input SQL Queries

 CREATE TABLE DEPARTMENT (
 DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    DEPT_ID INT,
    SALARY NUMERIC,
    CONSTRAINT fk_dept FOREIGN KEY (DEPT_ID)
        REFERENCES DEPARTMENT(DEPT_ID)
);

INSERT INTO DEPARTMENT VALUES (1, 'HR');

INSERT INTO DEPARTMENT VALUES (2, 'Finance');

INSERT INTO DEPARTMENT VALUES (3, 'IT');

INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 1, 25001);

INSERT INTO EMPLOYEE VALUES (102, 'Priya', 2, 28000);

INSERT INTO EMPLOYEE VALUES (103, 'Aman', 3, 45000);

INSERT INTO EMPLOYEE VALUES (104, 'Sneha', 2, 32003);

INSERT INTO EMPLOYEE VALUES (105, 'Karan', 1, 15000);

INSERT INTO EMPLOYEE VALUES (106, 'Meena', 3, 17501);


-- Task-1: Simple View

CREATE VIEW simple_emp_view AS
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

SELECT * FROM simple_emp_view;

-- Task-2: Complex View

CREATE VIEW complex_emp_view AS
SELECT d.DEPT_NAME, AVG(e.SALARY) AS avg_salary, COUNT(e.EMP_ID) AS total_employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DEPT_ID = d.DEPT_ID
GROUP BY d.DEPT_NAME;

SELECT * FROM complex_emp_view;


-- Task-3: Materialized View

CREATE MATERIALIZED VIEW mv_emp_salary_pg AS
SELECT d.DEPT_NAME, AVG(e.SALARY) AS avg_salary, COUNT(e.EMP_ID) AS total_employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DEPT_ID = d.DEPT_ID
GROUP BY d.DEPT_NAME;

REFRESH MATERIALIZED VIEW mv_emp_salary_pg;

SELECT * FROM mv_emp_salary_pg;

-- Task-4: Performance Analysis

EXPLAIN ANALYZE SELECT * FROM simple_emp_view;
EXPLAIN ANALYZE SELECT * FROM complex_emp_view;
EXPLAIN ANALYZE SELECT * FROM mv_emp_salary_pg;

Output 

Task 1:

 <img width="449" height="301" alt="image" src="https://github.com/user-attachments/assets/cf1c96ec-d63b-4b7e-8bff-3ed8cfbee62b" />

Task 2:

 <img width="747" height="208" alt="image" src="https://github.com/user-attachments/assets/02dadb75-e598-4d39-829d-428985c1b8f4" />

Task 3:

 <img width="633" height="214" alt="image" src="https://github.com/user-attachments/assets/c818abdb-ff66-4f9a-a228-d933d2e964ed" />

Task 4:
  
 <img width="975" height="266" alt="image" src="https://github.com/user-attachments/assets/2fe781e0-ec79-42e9-b4de-a9aeb05dc0c2" />

<img width="853" height="536" alt="image" src="https://github.com/user-attachments/assets/07e96ae2-2f87-4120-a8f6-240a27e82114" />

<img width="975" height="190" alt="image" src="https://github.com/user-attachments/assets/ff5f1a86-26b6-4696-80fb-99a3e51d148e" />

7. Learning Outcome

•	Understood the concept and working of materialized views in a database system.

•	Differentiated between simple views, complex views, and materialized views.

•	Learned how to create and refresh materialized views in PostgreSQL.

•	Measured and compared query execution time for different types of views.

•	Analyzed performance benefits of materialized views in data-intensive applications.

•	Applied materialized view concepts in real-world company scenarios such as SanDisk, JTG, and PayPal.
