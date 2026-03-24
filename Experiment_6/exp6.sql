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
