-- Q1 Write a query to display all columns and rows from the customer's table.
SELECT * 
FROM customers;


-- Q2 Retrieve only the first_name, last_name, and city of all customers.
SELECT 
     first_name,
     last_name,
     city 
FROM customers;


-- Q3 List all unique categories available in the products table.
SELECT
     DISTINCT category 
FROM products;


-- Q4 Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL.
/*
Table: customers , primary key - customer_id
Table: product , primary key - product_id
Table: order , primary key - order_id
Table: order_items , primary key - item_id

A primary key must be UNIQUE and NOT NULL because it is used to identify each row separately.

If two rows have the same primary key, the database will get confused about which row you are 
talking about. It won’t know which one to update, delete, or fetch. So uniqueness is needed 
so every record has its own identity.

If a primary key is NULL, then row has no identity at all, so the database cannot track it or use it properly.

*/


-- Q5 What constraints are applied to the email column in the customers table? What would happen 
-- if you tried to insert a duplicate email?
/*
The email column in the customers table has two constraints: UNIQUE and NOT NULL.

If we try to insert a duplicate email, the database will show a "duplicate key value violates unique 
constraint" error because each customer must have a unique email address. This helps prevent duplicate
customer records.

*/


-- Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it? 
-- Write both the INSERT statement and explain the error.
/*

The database throws an error because it violates the CHECK constraint.
INSERT INTO products VALUES (209, 'Laptop Stand', 'Electronics', 'AmazonBasics', -50 , 180);
Error occur because negative price values re not allowed, so the insert is rejected.

*/





