Experiment: Implementation of Cursors in PL/SQL

1. Aim of the Session

To understand the concept and working of cursors in PL/SQL for row-by-row data processing, and to analyze how implicit cursors, explicit cursors, and cursor attributes are used to implement business logic on multiple rows in a database table.

2. Software Requirements
●	Database:

○	Oracle live SQL
○	PostgreSQL Database (PgAdmin)

3. Objective of the Session

By the end of the session, the following objectives were achieved:

•	To implement and analyze the use of implicit cursors, explicit cursors, and cursor attributes.

•	To process multiple rows from a database table using cursors.

•	To apply business logic effectively on row-by-row data.

•	To differentiate between implicit and explicit cursors.

•	To use cursor attributes such as %FOUND, %NOTFOUND, %ROWCOUNT, and %ISOPEN.

4. Practical / Experiment Steps

The experiment was carried out through the following activities:

•	Table Setup: Create or use an existing EMPLOYEE table with multiple records.

•	Implicit Cursor Demonstration: Perform single-row DML operations (INSERT, UPDATE, DELETE) and observe implicit cursor behavior.

•	Explicit Cursor Demonstration: Write PL/SQL blocks to fetch and process multiple employee records using explicit cursors.

•	Cursor Attributes Usage: Apply attributes like %FOUND, %NOTFOUND, %ROWCOUNT, and %ISOPEN to control program execution.

•	Output Display: Print results or apply business logic for each record.

•	Verification: Execute PL/SQL blocks and verify correctness of row-by-row processing.

•	Documentation: Save PL/SQL scripts and outputs for reporting.


5. Procedure of the Practical

Execution was performed in the following order:

1.	Environment Setup: Logged into Oracle LIVE SQL Developer to prepare the workspace.

2.	Table Creation: Created the EMPLOYEE table with columns EMP_ID, EMP_NAME, and SALARY.
 
 <img width="752" height="170" alt="image" src="https://github.com/user-attachments/assets/58238985-f6b2-4b2f-8a82-ed3f694237f0" />

3.	Data Insertion: inserted of data in the EMPLOYEE table.
 
 <img width="617" height="239" alt="image" src="https://github.com/user-attachments/assets/d9b5a97b-d15d-40b3-88c9-e1bd87635c9c" />

4.	Implicit Cursor Implementation :

<img width="888" height="341" alt="image" src="https://github.com/user-attachments/assets/687c1abb-6e11-4154-b9d7-1a7b6fecbc8f" />

 
5.	Explicit Cursor Implementation :

<img width="890" height="408" alt="image" src="https://github.com/user-attachments/assets/aafd2488-f6fa-47c1-92e9-2acca1404829" />

 
6.	Cursor Attributes Demonstration :

 <img width="882" height="385" alt="image" src="https://github.com/user-attachments/assets/6c16c4d2-631d-4afb-8c38-854d2777c9fb" />


7.	Output Verification: Executed the block and verified the output for correctness.

8.	Documentation: Saved the SQL script and captured outputs for reporting and future reference.


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

-- Task-1: Implicit Cursor

BEGIN

  UPDATE EMPLOYEE SET SALARY = SALARY + 1000 WHERE EMP_ID = 101;

  IF SQL%FOUND THEN
  
  DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
  
  END IF;

  
  DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);

END;

-- Task-2: Explicit Cursor

DECLARE

  CURSOR emp_cursor IS SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE;
  
  id EMPLOYEE.EMP_ID%TYPE;

  name EMPLOYEE.EMP_NAME%TYPE;

  salary EMPLOYEE.SALARY%TYPE;

BEGIN

  OPEN emp_cursor;

  LOOP

  FETCH emp_cursor INTO id, name, salary;
  
  EXIT WHEN emp_cursor%NOTFOUND;

  DBMS_OUTPUT.PUT_LINE('ID: ' || id || ', Name: ' || name || ', Salary: ' || salary);

  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total rows processed: ' || emp_cursor%ROWCOUNT);

  CLOSE emp_cursor;

END;

-- Task-3: Cursor Attributes Demonstration

BEGIN

  DELETE FROM EMPLOYEE WHERE SALARY < 20000;

  IF SQL%FOUND THEN
  
  DBMS_OUTPUT.PUT_LINE('Records deleted: ' || SQL%ROWCOUNT);
  
  ELSE
    
  DBMS_OUTPUT.PUT_LINE('No records deleted.');
  
  END IF;

END;

Output 

Task 1:

<img width="675" height="289" alt="image" src="https://github.com/user-attachments/assets/2f289efe-ef6f-4fe4-8015-b5dd2d7272a8" />

Task 2:

<img width="629" height="351" alt="image" src="https://github.com/user-attachments/assets/256fc21f-48e0-4ac4-92c2-6f32fc01c886" />

Task 3:

 <img width="578" height="323" alt="image" src="https://github.com/user-attachments/assets/b3e4cfac-0421-4e43-9115-880fd9ce5b10" />

7. Learning Outcome

•	From this practical, the following knowledge and skills were gained:

•	Understood the role of cursors in PL/SQL for handling multi-row query results.

•	Differentiated between implicit and explicit cursors.

•	Learned how to use cursor attributes (%FOUND, %NOTFOUND, %ROWCOUNT, %ISOPEN).

•	Practiced writing PL/SQL programs that process records row by row.
•	Strengthened ability to apply cursor-based logic to real-world business scenarios in organizations like Oracle, Accenture, Scaler, and D. E. Shaw & Co.

