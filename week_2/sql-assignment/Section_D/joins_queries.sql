-- Q19. Write an INNER JOIN query to display each order along with the customer's first_name and 
-- last_name. Show: order_id, order_date, first_name, last_name, total_amount.
SELECT 
     od.order_id, 
     od.order_date, 
     cs.first_name, 
     cs.last_name, 
	 od.total_amount 
FROM customers AS cs 
INNER JOIN orders AS od 
    ON cs.customer_id=od.customer_id;


-- Q20. Using a LEFT JOIN, list ALL customers and their orders (if any).
-- Customers with no orders should still appear with NULL values for order columns.
SELECT 
	cs.*,
    od.* 
FROM customers AS cs 
LEFT JOIN orders AS od 
    on cs.customer_id=od.customer_id ;

-- Q21. Write a query using JOINs across three tables (orders → order_items → products) 
-- to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item.
SELECT 
	od.order_id, 
    pd.product_name, 
    oi.quantity, 
    oi.unit_price, 
    oi.discount_pct 
FROM orders AS od 
INNER JOIN order_items AS oi 
	ON od.order_id=oi.order_id 
INNER JOIN products AS pd  
    ON pd.product_id=oi.product_id; 


-- Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example 
-- from this schema. When would you use a FULL OUTER JOIN?
/*
LEFT JOIN :
It shows all rows from the left table and matching rows from the right table. 
If no match, right side is NULL.

RIGHT JOIN :
It shows all rows from the right table and matching rows from the left table. 
If no match, left side is NULL.

You would use a FULL OUTER JOIN when you want to see all records
from both tables, even if there is no match between them.
 */


-- Q23. Identify all Foreign Key relationships in the schema. Explain what would happen
-- if you tried to insert an order with customer_id = 999 (which doesn't exist in customers).
/*
Foreign Key relationships in the schema :
       customers.customer_id ◀──FK── orders.customer_id 
       orders.order_id ◀──FK── order_items.order_id 
       products.product_id ◀──FK── order_items.product_id
       
If you try to insert an order with customer_id = 999 and that customer does not exist in the customers table, 
the database will not allow it. It will show an error because it violates the foreign key constraint.
*/
