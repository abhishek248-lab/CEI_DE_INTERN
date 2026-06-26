-- 1.Load dataset into a SQL database.
-- The dataset was imported into MySQL using the Table Data Import Wizard.


-- 2.Explore table (schema, sample data).
DESCRIBE `sample - superstore`;

SELECT * 
FROM `sample - superstore`;


-- 3.Apply WHERE filters (region, category, date, sales).
-- region
SELECT *
FROM `sample - superstore`
WHERE region = 'West';

-- category
SELECT *
FROM `sample - superstore`
WHERE category = 'Furniture';

 -- date
SELECT *
FROM `sample - superstore`
WHERE STR_TO_DATE(`Order Date`, '%m/%d/%Y')
      BETWEEN '2015-03-17' AND '2017-06-17';

-- sales
SELECT *
FROM `sample - superstore`
WHERE sales > 200;


-- 4.Use GROUP BY for aggregations (sales, quantity, averages).
-- sales
SELECT 
	 Region,
	 SUM(Sales) AS total_sales
FROM `sample - superstore`
GROUP BY Region;

-- quantity
SELECT 
      Category,
	  SUM(Quantity) AS total_quantity
FROM `sample - superstore`
GROUP BY Category;

-- averages
SELECT 
      Segment,
	  AVG(Sales) AS avg_sales
FROM `sample - superstore`
GROUP BY Segment;


-- 5.Sort and limit results (top products, top categories)
SELECT `Product Name`, Category
FROM `sample - superstore`
ORDER BY Category DESC
LIMIT 5;


-- 6.Solve use cases (monthly trends, top customers, duplicates).
-- monthly trends
SELECT *,
       DENSE_RANK() OVER (
           PARTITION BY DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m')
           ORDER BY Quantity DESC
       ) AS trend_rank
FROM `sample - superstore`;

-- top customers
WITH customer_totals AS (
    SELECT 
        `Customer Name`,
        SUM(Sales) AS total_purchase
    FROM `sample - superstore`
    GROUP BY `Customer Name`
)
SELECT 
    `Customer Name`,
    total_purchase,
    DENSE_RANK() OVER (ORDER BY total_purchase DESC) AS ranking
FROM customer_totals ;

-- duplicates
SELECT 
     `Order ID`,
     `Customer ID`,
      COUNT(*) AS duplicates
FROM `sample - superstore`
GROUP BY `Customer ID`,`Order ID`
       HAVING COUNT(*) > 1;
       
       
-- 7.Validate results (row counts, data quality)
-- row counts
SELECT  COUNT(*) AS row_count
FROM `sample - superstore` ;

-- data quality
SELECT 
    SUM(CASE
          WHEN Sales IS NULL THEN 1 
          ELSE 0 
	   END) AS missing_sales,
    SUM(CASE 
         WHEN Profit IS NULL THEN 1 
		 ELSE 0 END) AS missing_profit
FROM `sample - superstore`;


-- brief insights
/*
- Successfully imported the Superstore dataset into MySQL and explored its schema 
  and sample records to understand the data structure.
- Applied filters to analyze records by region, category, date range, and sales, 
  enabling focused business insights.
- Used GROUP BY, aggregate functions, sorting, and ranking to identify sales trends, 
  top customers, and category performance.
- Validated data quality by checking row counts, duplicate records, and missing values, 
  ensuring reliable analysis.

*/



