USE platinumrx_clinic;
-- Q1: Revenue from each sales channel in 2021

SELECT sales_channel,
       SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

-- Q2: Top 10 customers based on total spending
SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- Q3: Monthly revenue, expense, profit and status
SELECT m.month,
       m.revenue,
       e.expense,
       (m.revenue - e.expense) AS profit,
       CASE 
           WHEN (m.revenue - e.expense) > 0 THEN 'Profitable'
           ELSE 'Not Profitable'
       END AS status
FROM (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) m
JOIN (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) e
ON m.month = e.month;

-- Q4: Most profitable clinic per city (September)
SELECT *
FROM (
    SELECT c.city,
           cs.cid,
           SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit,
           DENSE_RANK() OVER (
               PARTITION BY c.city 
               ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) DESC
           ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid 
        AND MONTH(e.datetime)=9
    WHERE MONTH(cs.datetime)=9 AND YEAR(cs.datetime)=2021
    GROUP BY c.city, cs.cid
) t
WHERE rnk = 1;

-- Q5: Second least profitable clinic per state
SELECT *
FROM (
    SELECT c.state,
           cs.cid,
           SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit,
           DENSE_RANK() OVER (
               PARTITION BY c.state 
               ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) ASC
           ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid 
        AND MONTH(e.datetime)=9
    WHERE MONTH(cs.datetime)=9 AND YEAR(cs.datetime)=2021
    GROUP BY c.state, cs.cid
) t
WHERE rnk = 2;