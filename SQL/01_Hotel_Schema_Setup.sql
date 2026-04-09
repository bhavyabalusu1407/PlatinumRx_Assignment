-- Creating a database platinumrx
CREATE DATABASE platinumrx;
USE platinumrx;

-- Creating users table
CREATE TABLE users(
 user_id VARCHAR(50),
 name VARCHAR(50),
 phone_number VARCHAR(15),
 mail_id VARCHAR(50),
 billing_address VARCHAR(10));
 
 -- Creating bookings table
 CREATE TABLE bookings(
 booking_id VARCHAR(50),
 booking_date DATETIME,
 room_no VARCHAR(50),
 user_id VARCHAR(50)
 );
 
 -- Creating items table
 CREATE TABLE items(
 item_id VARCHAR(50),
 item_name VARCHAR(50),
 item_rate INT);
 
 -- Creating booking commericals table
 CREATE TABLE booking_commercials(
 id VARCHAR(50),
 booking_id VARCHAR(50),
 bill_id VARCHAR(50),
 bill_date DATETIME,
 item_id VARCHAR(50),
 item_quantity FLOAT);
 
 -- Inserting values into users table
 INSERT INTO users VALUES
 ('u1','John','9832456710','john@gmail.com','Hyderabad'),
 ('u2','Alice','8970653421','alice@gmail.com','Cheenai');
 
 -- Inserting values into bookings table
 INSERT INTO bookings VALUES
('b1','2021-11-10 10:00:00','101','u1'),
('b2','2021-11-15 12:00:00','102','u1'),
('b3','2021-10-05 09:00:00','201','u2');

-- Inserting values into items table
INSERT INTO items VALUES
('i1','Paratha',20),
('i2','Veg Curry',100);

-- Inserting values into bookings commercials table
INSERT INTO booking_commercials VALUES
('c1','b1','bill1','2021-11-10','i1',2),
('c2','b1','bill1','2021-11-10','i2',1),
('c3','b3','bill2','2021-10-05','i2',15);
 
 SELECT * FROM users;
 SELECT * FROM bookings;
 TRUNCATE TABLE bookings;
 
 INSERT INTO bookings VALUES
('b1','2021-11-10 10:00:00','101','u1'),
('b2','2021-11-15 12:00:00','102','u1'),
('b3','2021-10-05 09:00:00','201','u2');

 SELECT * FROM bookings;
 SELECT * FROM items;
 SELECT * FROM booking_commercials;
 
 