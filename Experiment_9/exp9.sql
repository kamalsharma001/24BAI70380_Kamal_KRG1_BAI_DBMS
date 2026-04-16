CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  working_hours INT,
  perhour_salary NUMERIC,
  total_payable_amount NUMERIC
);

CREATE OR REPLACE FUNCTION CALCULATE_AMOUNT()
RETURNS TRIGGER
AS $$
BEGIN
  NEW.total_payable_amount = NEW.perhour_salary * NEW.working_hours;
  IF NEW.total_payable_amount > 25000 THEN
    RAISE EXCEPTION 'AMOUNT IS GREATER THAN 25000';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER CAL_PAYABLE_AMOUNT
BEFORE INSERT
ON employees
FOR EACH ROW
EXECUTE FUNCTION CALCULATE_AMOUNT();

DO $$
BEGIN
  INSERT INTO employees(emp_id, emp_name, working_hours, perhour_salary)
  VALUES (1, 'Sam', 10, 250);
EXCEPTION
  WHEN OTHERS THEN RAISE NOTICE '%', SQLERRM;
END;
$$;

SELECT * FROM employees;

DO $$
BEGIN
  INSERT INTO employees(emp_id, emp_name, working_hours, perhour_salary)
  VALUES (2, 'Amit', 11, 28000);
EXCEPTION
  WHEN OTHERS THEN RAISE NOTICE '%', SQLERRM;
END;
$$;
