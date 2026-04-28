
DROP TABLE IF EXISTS Tbl_Supply_logs;
DROP TABLE IF EXISTS Tbl_Orders;
DROP TABLE IF EXISTS Tbl_Products;
DROP TABLE IF EXISTS Tbl_Suppliers;


CREATE TABLE Tbl_Suppliers (
    sup_id INT PRIMARY KEY,
    sup_name VARCHAR(100),
    city VARCHAR(50),
    rating INT
);


CREATE TABLE Tbl_Products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100), 
    category VARCHAR(50),
    price INT,
    stock_qty INT,
    sup_id INT,
    FOREIGN KEY (sup_id) REFERENCES Tbl_Suppliers(sup_id)
);


CREATE TABLE Tbl_Orders (
    order_id INT PRIMARY KEY,
    prod_id INT,
    cust_id INT,
    order_date DATE,
    qty INT,
    FOREIGN KEY (prod_id) REFERENCES Tbl_Products(prod_id)
);


INSERT INTO Tbl_Suppliers VALUES
(701, 'NextGen Tech', 'Bangalore', 5),
(702, 'Comfort Hub', 'Mumbai', 4);


INSERT INTO Tbl_Products VALUES
(501, 'Laptop Pro', 'Electronics', 75000, 15, 701),
(502, 'Ergo Chair', 'Furniture', 15000, 8, 702);


INSERT INTO Tbl_Orders VALUES
(9001, 501, 101, '2026-04-20', 1),
(9002, 502, 102, '2026-04-21', 2);


SELECT DISTINCT s.city, p.category
FROM Tbl_Suppliers s
JOIN Tbl_Products p ON s.sup_id = p.sup_id;


CREATE OR REPLACE FUNCTION restrict_order_date_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.order_date <> OLD.order_date THEN
        RAISE EXCEPTION 'Modification of order_date is not allowed.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_restrict_date_change
BEFORE UPDATE ON Tbl_Orders
FOR EACH ROW
EXECUTE FUNCTION restrict_order_date_update();

UPDATE Tbl_Orders SET order_date = '2026-12-31' WHERE order_id = 9001;
