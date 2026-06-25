-- Q24. Write a query using CASE to classify products into price tiers: 
-- • 'Budget' → unit_price < 1000 
-- • 'Mid-Range' → unit_price BETWEEN 1000 AND 3000 
-- • 'Premium' → unit_price > 3000
-- Display: product_name, unit_price, price_tier.

SELECT 
	product_name, 
    unit_price, 
    CASE 
        WHEN unit_price < 1000 THEN 'Budget'
        WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
        ELSE 'Primium'
    END AS price_tier 
FROM products ;


-- Q25. Using a CASE statement inside an aggregate function, count how many orders are 
-- 'Delivered' vs 'Not Delivered' (all other statuses). Display the result in a single row

SELECT 
	count(
         CASE 
			WHEN status = 'Delivered'  THEN 'delivered'
	     END
	 ) AS Delivered,
	count(
		 CASE 
		     WHEN status <> 'Delivered'  THEN 'delivered'
		 END
	) AS Not_Delivered
FROM orders ;


-- Q26. Explain each letter of ACID: • A – Atomicity • C – Consistency • I – Isolation • D – Durability
-- Give a real-world example (e.g., bank transfer) showing why each property is important.
/*

Atomicity means either all parts of a transaction are executed, or none of them are executed.
Example: During a bank transfer of 1,000 from Account A to Account B:
		 1,000 is deducted from Account A.
         1,000 is added to Account B.
         If the system crashes after the deduction but before the addition, 
         the entire transaction is canceled (rolled back). This prevents money from being lost.

Consistency means the database always remains in a valid state before and after a transaction.
Example: Before Transaction:
		       A=1000 ,B=3000
		       A + B =4000
          A sent 200 to B , 200 deducted from A and 200 added in B 
          After Transaction:
               A=800, B=3200
               A + B = 4000
		 This shows database is consistent before and after transaction

Isolation means multiple transactions can run simultaneously in independent environments 
without affecting each other.
Example: If two people withdraw money from the same account at the same time, each transaction 
is handled separately, so the account balance stays correct.

Durability means once a transaction is successfully completed and committed, it is permanently 
saved, even if a system failure occurs.
Example: A customer transfers 5,000 from one account to another. Right after the transaction is completed, 
the system crashes. When it restarts, the transfer is still there and the balance is correctly updated.

*/


-- Q27. Write a SQL transaction that does the following atomically: 
-- 1. Insert a new order  (order_id=1011, customer_id=102, today's date, 'Pending', 1598.00) 
-- 2. Insert two order items for that order 
-- 3. Update the stock_qty of the purchased products 
-- 4. If any step fails, ROLLBACK the entire transaction. Otherwise, COMMIT. Write the complete BEGIN...COMMIT/ROLLBACK block.

DELIMITER //
CREATE PROCEDURE place_order()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO orders (order_id, customer_id, order_date, status, total_amount)
    VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES 
    (1011, 201, 2, 499.00),
    (1011, 305, 1, 600.00);

    UPDATE products
    SET stock_qty = stock_qty - 2
    WHERE product_id = 201;

    UPDATE products
    SET stock_qty = stock_qty - 1
    WHERE product_id = 305;

    COMMIT;
END//
DELIMITER ;

CALL place_order();



