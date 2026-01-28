Experiment: Implementation of Conditional Logic using IF–ELSE in PL/SQL

1. Aim of the Session
To understand the basic structure of a PL/SQL program by creating and executing a simple PL/SQL block that includes declaration and execution sections, and to display output using built-in procedures.

2. Software Requirements
●	Database:
      ○	Oracle live SQL
      ○	PostgreSQL Database (PgAdmin)

3. Objective of the Session

By the end of the session, the following objectives were achieved:

   •	To practice writing PL/SQL blocks with proper syntax and structure.

  •	To declare and initialize variables in PL/SQL effectively.
    
  •	To apply conditional logic using IF-ELSIF-ELSE statements for decision making.
    
  •	To display results using DBMS_OUTPUT for verification and debugging.

5. Practical / Experiment Steps

The experiment was carried out through the following activities:

  1.	Variable Declaration: Declared EMP_ID, EMP_NAME, SALARY, and TAX variables with appropriate data types.
    
  2.	Initialization: Assigned meaningful values to EMP_ID, EMP_NAME, and SALARY to simulate employee data.
  
  3.	Output Display: Printed employee details using DBMS_OUTPUT to confirm correct variable assignment.
  
  4.	Conditional Logic: Applied IF-ELSIF-ELSE statements to calculate tax based on salary slabs, demonstrating control flow.
  
  5.	Result Display: Printed calculated tax using DBMS_OUTPUT to validate the conditional logic.

7. Procedure of the Practical

  Execution was performed in the following order:
  
  1.	Environment Setup: Logged into Oracle LIVE SQL Developer to prepare the workspace.
  
  2.	PL/SQL Block Creation: Wrote the PL/SQL block with variable declarations and initialization.
  
  <img width="524" height="168" alt="image" src="https://github.com/user-attachments/assets/f0f30c4a-e1b3-48a9-bdd4-7e050638884f" />

  3.	Conditional Execution: Implemented salary-based tax calculation logic using IF-ELSIF-ELSE.
  
   <img width="499" height="400" alt="image" src="https://github.com/user-attachments/assets/5580d06e-6da6-449d-86a3-4596b5811281" />


  4.	Output Verification: Executed the block and verified the output for correctness.
   
  <img width="805" height="118" alt="image" src="https://github.com/user-attachments/assets/b68886c9-bd2c-47d4-b41c-9abbc6a301c5" />
    
  <img width="761" height="55" alt="image" src="https://github.com/user-attachments/assets/bd545600-76d2-487b-9f63-ba049c3e7755" />

  5.	Documentation: Saved the PL/SQL script and captured outputs for reporting and future reference.

6. I/O Analysis (Input / Output Analysis)
Input SQL Queries


DECLARE


EMP_ID    NUMBER:= 7404;

EMP_NAME VARCHAR2(50) := 'Happy';

SALARY    NUMBER(12,2): = 450000;

TAX       NUMBER;


BEGIN

DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID    : ' || EMP_ID);

DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME  : ' || EMP_NAME);

DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY: ' || SALARY);

IF SALARY <= 250000 THEN

TAX := 0;

ELSIF SALARY <= 500000 THEN

TAX := SALARY * 0.05;

ELSIF SALARY <= 1000000 THEN

TAX := SALARY * 0.20;

ELSE

TAX := SALARY * 0.30;

END IF;


DBMS_OUTPUT.PUT_LINE('TAX PAYABLE    : ' || TAX);

END;

Output 

 <img width="636" height="330" alt="image" src="https://github.com/user-attachments/assets/d0db098d-4c93-49c3-a7a1-d8607a34c950" />

7. Learning Outcome

From this practical, the following knowledge and skills were gained:

•	Learned how to declare and initialize variables in PL/SQL with appropriate data types.

•	Understood the use of conditional logic using IF-ELSIF-ELSE statements to control program flow.

•	Practiced tax calculation based on salary ranges, reinforcing the concept of conditional branching.

•	Gained experience in displaying results using DBMS_OUTPUT, which is essential for debugging and output verification.

•	Strengthened understanding of PL/SQL procedural programming concepts, preparing for more complex database programming tasks.

•	Developed the ability to translate real-world business rules into executable PL/SQL code.
