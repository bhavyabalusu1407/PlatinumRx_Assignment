-- Creating a database 
CREATE DATABASE platinumrx_clinic;
USE platinumrx_clinic;

-- Creating Clinics Table
CREATE TABLE clinics (
    cid VARCHAR(20),
    clinic_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

-- Creating Customers Table
CREATE TABLE customer (
    uid VARCHAR(20),
    name VARCHAR(50),
    mobile VARCHAR(15)
);

-- Creating Clinic Sales Table
CREATE TABLE clinic_sales (
    oid VARCHAR(30),
    uid VARCHAR(20),
    cid VARCHAR(20),
    amount INT,
    datetime DATETIME,
    sales_channel VARCHAR(30)
);

-- Creating Expenses Table
CREATE TABLE expenses (
    eid VARCHAR(30),
    cid VARCHAR(20),
    description VARCHAR(100),
    amount INT,
    datetime DATETIME
);

-- Inserting values into clinics table
INSERT INTO clinics VALUES
('c1','Apollo Clinic','Hyderabad','Telangana','India'),
('c2','City Care','Hyderabad','Telangana','India'),
('c3','LifeCare','Chennai','Tamil Nadu','India'),
('c4','MedPlus','Chennai','Tamil Nadu','India'),
('c5','HealthFirst','Bangalore','Karnataka','India');

-- Inserting values into customer table
INSERT INTO customer VALUES
('u1','John','9876543210'),
('u2','Alice','9876543211'),
('u3','Bob','9876543212'),
('u4','David','9876543213'),
('u5','Eva','9876543214');

-- INserting values into clinic sales table
INSERT INTO clinic_sales VALUES
('o1','u1','c1',5000,'2021-09-10 10:00:00','online'),
('o2','u2','c1',3000,'2021-09-15 12:00:00','offline'),
('o3','u3','c2',7000,'2021-09-20 14:00:00','online'),
('o4','u4','c2',2000,'2021-09-25 16:00:00','offline'),

('o5','u1','c3',8000,'2021-09-12 11:00:00','online'),
('o6','u2','c3',1000,'2021-09-18 13:00:00','offline'),
('o7','u3','c4',6000,'2021-09-22 15:00:00','online'),
('o8','u5','c4',4000,'2021-09-28 17:00:00','offline'),

('o9','u1','c5',9000,'2021-09-14 10:30:00','online'),
('o10','u2','c5',2000,'2021-09-19 12:30:00','offline');

-- Inserting values into expenses
INSERT INTO expenses VALUES
('e1','c1','Medicines',2000,'2021-09-10'),
('e2','c2','Equipment',3000,'2021-09-20'),
('e3','c3','Staff Salary',4000,'2021-09-12'),
('e4','c4','Maintenance',1500,'2021-09-22'),
('e5','c5','Utilities',2500,'2021-09-14');

SELECT * FROM clinics;
SELECT * FROM clinic_sales;
SELECT * FROM expenses;
