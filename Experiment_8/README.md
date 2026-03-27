Experiment: Implementation of Stored procedures

1. Aim of the Session

To explore the design and implementation of stored procedures in PL/SQL, with emphasis on the use of parameter modes (IN, OUT, and INOUT) for encapsulating business logic and enabling modular programming within a database.

2. Software Requirements

●	Database:

○	Oracle live SQL
○	PostgreSQL Database (PgAdmin)

3. Objective of the Session

By the end of the session, the following objectives were achieved:

•	Develop and execute a parameterized stored procedure that processes employee data.

•	Demonstrate the use of IN, OUT, and INOUT parameters to return computed results and execution status.

•	Illustrate the invocation of procedures through anonymous blocks.

4. Practical / Experiment Steps

The experiment was carried out through the following activities:

•	Schema Setup: Created the employees table with a primary key and defined appropriate data types for personal and financial attributes.

•	Procedure Encapsulation: Designed the procedure get_employee_count_by_gender to count records based on gender.

•	Parameter Configuration: Applied IN for input, OUT for returning the count, and INOUT for updating the execution status.

•	Logic Integration: Used the SELECT INTO clause to assign aggregate query results directly to output variables.

•	Anonymous Block Execution: Constructed a DO block to declare local variables, invoke the procedure, and display results to the user.

5. Procedure of the Practical

Execution was performed in the following order:

•	Connected to the PostgreSQL server and initialized the workspace.

•	Executed CREATE TABLE to define the employee structure and inserted a balanced dataset of male and female records.

•	Defined the procedure signature with IN, OUT, and INOUT parameters.

•	Implemented the PL/pgSQL body to perform a COUNT(*) operation filtered by gender.

•	Updated the STATUS variable with the string 'SUCCESS' to indicate successful execution.

•	Declared variables in an anonymous block, initialized with 'Female' as the gender filter and 'Pending' as the status.

•	Called the procedure using CALL, passing arguments and capturing returned values.

•	Printed the results using RAISE NOTICE.

•	Verified the output against table records to confirm accuracy.


6. I/O Analysis (Input / Output Analysis)

SQL Input Queries


CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);

Output :
 
<img width="683" height="269" alt="image" src="https://github.com/user-attachments/assets/d280a28a-5f2c-4e1c-83f1-526fad7c6bcf" />

SQL Input Queries

INSERT INTO employees (emp_name, gender, salary) VALUES
('Amit', 'Male', 30000),
('Riya', 'Female', 35000),
('John', 'Male', 28000),
('Sneha', 'Female', 40000),
('Rahul', 'Male', 32000);

Output :

<img width="694" height="306" alt="image" src="https://github.com/user-attachments/assets/a21ce2c4-697f-4a75-9ef3-bb97b239cb23" />

 
SQL input Queries 

CREATE OR REPLACE PROCEDURE  get_Employee_Count_BY_Gender (IN IN_GENDER VARCHAR(20), OUT OUT_COUNT INT, INOUT STATUS VARCHAR(20))
AS
$$
	BEGIN

  SELECT COUNT(*) INTO OUT_COUNT  FROM employees  WHERE GENDER='Male';
	
  STATUS:='SUCCESS';
	
END;

$$ LANGUAGE PLPGSQL;

Output :

<img width="695" height="264" alt="image" src="https://github.com/user-attachments/assets/3a4e7cbb-3b62-4b63-814f-c7ab94b10d96" />

 
SQL input Queries 

DO

$$

DECLARE

GEN VARCHAR(20):='Male';

Count_of_Employee int;

STATUS VARCHAR:='Pending';

BEGIN
	CALL  get_Employee_Count_BY_Gender(GEN,Count_of_Employee,STATUS);
	RAISE NOTICE 'YOUR COUNT OF EMPLOYEE BY GENDER IS % AND YOUR STATUS IS %',Count_of_Employee,STATUS;
END;
$$

Output :

<img width="953" height="256" alt="image" src="https://github.com/user-attachments/assets/4e3c9976-0739-4113-8b9e-04a61f92aee0" />

 
7. Learning Outcome

•	Gained understanding of how SQL logic can be encapsulated into reusable procedures for better maintainability.

•	Practiced the use of IN, OUT, and INOUT parameter modes for data transfer in stored subprograms.

•	Learned to connect aggregate SQL functions with PL/SQL variables using the INTO keyword.

•	Acquired skills in using status flags and notice alerts to track execution success and results.




