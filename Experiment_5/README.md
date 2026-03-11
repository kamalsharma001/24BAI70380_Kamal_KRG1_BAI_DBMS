Experiment: Implementation of Conditional Logic using MOD Operator in SQL

1. Aim of the Session : To understand and apply conditional logic in SQL by using the modulus operator (MOD / %) to analyse numerical data and classify employee salaries as odd or even, thereby improving data analysis and decision-making skills in SQL.

2. Software Requirements
    
  ○	Oracle live SQL

  ○	PostgreSQL Database (PgAdmin)

3. Objective of the Session
   
By the end of the session, the following objectives were achieved:

•	To practice writing SQL queries using the MOD operator.

•	To classify employee salaries into odd and even categories.

•	To display results separately for odd and even salaries.

•	To strengthen understanding of conditional logic in SQL queries.


4. Practical / Experiment Steps

The experiment was carried out through the following activities:

1.	Table Setup: Create or use an existing EMPLOYEE table with a SALARY column.

2.	Odd-Even Classification: Apply the MOD operator to check whether salary values are odd or even.

3.	Output Display: Use SELECT queries with conditional logic to display odd and even salaries separately.

4.	Verification: Execute queries and verify correctness of classification.

5.	Documentation: Save SQL scripts and outputs for reporting.


5. Procedure of the Practical

Execution was performed in the following order:

1.	Environment Setup: Logged into Oracle LIVE SQL Developer to prepare the workspace.

2.	Table Creation: created the EMPLOYEE table.

<img width="752" height="170" alt="image" src="https://github.com/user-attachments/assets/e19dcab7-fb61-4536-98fb-287589f17087" />


3.	Data Insertion: inserted of data in the EMPLOYEE table.

<img width="617" height="239" alt="image" src="https://github.com/user-attachments/assets/c6fc3a05-8680-448e-91bc-af0e8d449f24" />

 
4.	SQL Queries Execution: Wrote SQL queries using MOD(SALARY, 2) to classify salaries.

<img width="500" height="139" alt="image" src="https://github.com/user-attachments/assets/b6086e04-0e4e-451b-80fd-e02ba5530482" />

<img width="502" height="136" alt="image" src="https://github.com/user-attachments/assets/0be7f2d5-9c4f-4c3d-92c4-acb4e245dcb8" />

<img width="708" height="248" alt="image" src="https://github.com/user-attachments/assets/5dd96d79-c61e-4c5f-825d-8783cc70407b" />

 
5.	Output Verification: Executed the block and verified the output for correctness.

6.	Documentation: Saved the SQL script and captured outputs for reporting and future reference.

6. I/O Analysis (Input / Output Analysis)

Input SQL Queries

CREATE TABLE EMPLOYEE (
    EMP_ID     NUMBER PRIMARY KEY,
    EMP_NAME   VARCHAR2(50),
    SALARY     NUMBER
)

INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 25001)

INSERT INTO EMPLOYEE VALUES (102, 'Priya', 28000)

INSERT INTO EMPLOYEE VALUES (103, 'Aman', 45000)

INSERT INTO EMPLOYEE VALUES (104, 'Sneha', 32003)

INSERT INTO EMPLOYEE VALUES (105, 'Karan', 15000)

INSERT INTO EMPLOYEE VALUES (106, 'Meena', 17501)

-- Task-1: Odd Salaries
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE MOD(SALARY, 2) = 1

-- Task-2: Even Salaries
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE MOD(SALARY, 2) = 0

-- Task-3: Combined Classification
SELECT EMP_ID, EMP_NAME, SALARY,
       CASE 
         WHEN MOD(SALARY, 2) = 0 THEN 'EVEN'
         ELSE 'ODD'
       END AS SALARY_TYPE
FROM EMPLOYEE


Output 


Task 1:

 <img width="786" height="333" alt="image" src="https://github.com/user-attachments/assets/1b234a54-88fd-4bde-8386-c0805eb2e139" />


Task 2:

<img width="810" height="384" alt="image" src="https://github.com/user-attachments/assets/5f5215ab-1968-4218-9364-c11954500e78" />


Task 3:

<img width="975" height="476" alt="image" src="https://github.com/user-attachments/assets/dc317aeb-e957-40c9-80f7-7b8ab59fd271" />

 
7. Learning Outcome

From this practical, the following knowledge and skills were gained:

•	Learned how to use the MOD operator in SQL for numerical analysis.

•	Understood classification of data based on odd/even logic.

•	Practiced writing conditional queries with CASE statements.

•	Strengthened ability to apply SQL for real-world business rules (e.g., salary categorization).

•	Prepared for more advanced SQL operations involving conditional logic and data grouping.
