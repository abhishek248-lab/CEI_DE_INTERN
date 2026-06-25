-- Q7. Retrieve all orders with status = 'Delivered'.
SELECT 
	 * 
FROM orders 
WHERE status = 'Delivered';


-- Q8 Find all products in the 'Electronics' category with a unit_price greater than ₹2000.
SELECT
     * 
FROM products 
WHERE category = 'Electronics' 
     AND unit_price > 2000;


-- Q9 List all customers who joined in the year 2024 and belong to the state 'Maharashtra'.
SELECT 
	* 
FROM customers 
WHERE YEAR(JOIN_DATE) = 2024 
      AND state = 'Maharashtra';


-- Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled.
SELECT 
     * 
FROM orders 
WHERE (order_date BETWEEN '2024-08-10' AND '2024-08-25') 
       AND STATUS <> 'Cancelled';


-- Q11. Explain what the index idx_orders_date does. How would it improve the performance of a query that 
-- filters orders by order_date? Write a sample query that would benefit from this index.
/*
idx_orders_date is an index on the order_date column that helps the database find records faster.
It improves performance by allowing the database to use the index instead of scanning every row 
in the table.So the database does less work and the query runs quicker.

SELECT 
     * 
FROM orders 
WHERE order_date 
	 BETWEEN '2024-08-10' AND '2024-08-25';
     
*/


-- Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024; — would the index on 
-- join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable).
/*

No, the index on join_date will usually not be used.
Because YEAR(join_date) applies a function on the column, 
the database can’t directly use the index and as a result scan the whole table.

SELECT 
     * 
FROM customers 
WHERE join_date 
     BETWEEN '2024-01-01' AND '2024-12-31';
     
*/


