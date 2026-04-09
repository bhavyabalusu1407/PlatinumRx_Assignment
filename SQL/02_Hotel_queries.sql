USE platinumrx;

--  1.For every user in the system, get the user_id and last booked room_no
 SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b1.user_id = b2.user_id
);

-- 2.Get booking_id and total billing amount of every booking created in November, 2021
SELECT booking_id, SUM(item_quantity * item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_d
WHERE MONTH(bill_date)=11 AND YEAR(bill_date)=2021
GROUP BY booking_id;

-- 3 Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000
SELECT bill_id, SUM(item_quantity * item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_d
WHERE MONTH(bill_date)=10 AND YEAR(bill_date)=2021
GROUP BY bill_id
HAVING bill_amount > 1000;

-- 4. Determine the most ordered and least ordered item of each month of year 2021

SELECT MONTH(bill_date) AS month, item_id, SUM(item_quantity) total_quantity
FROM booking_commercials
WHERE YEAR(bill_date)=2021
GROUP BY month, item_id;


INSERT INTO booking_commercials VALUES
('c4','b2','bill3','2021-11-15','i1',5),
('c5','b2','bill3','2021-11-15','i2',2),

('c6','b4','bill4','2021-11-20','i1',1),
('c7','b4','bill4','2021-11-20','i2',1);

-- 5. Find the customers with the second highest bill value of each month of year 2021
SELECT *
FROM (
    SELECT MONTH(bill_date) AS month,
           bill_id,
           SUM(item_quantity * item_rate) total_bill,
           DENSE_RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity * item_rate) DESC) rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id=i.item_d
    WHERE YEAR(bill_date)=2021
    GROUP BY month, bill_id
) t
WHERE rnk=2;