/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT PRODUCTS.NAME AS 'PRODUCT NAME', CATEGORIES.NAME AS 'CATEGORY NAME'
FROM PRODUCTS
INNER JOIN CATEGORIES 
ON PRODUCTS.CATEGORYID = CATEGORIES.CATEGORYID
WHERE CATEGORIES.NAME = 'COMPUTERS';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT PRODUCTS.NAME AS 'PRODUCT NAME', PRODUCTS.PRICE AS 'PRODUCT PRICE', REVIEWS.RATING AS 'RATING'
FROM PRODUCTS
INNER JOIN REVIEWS
ON PRODUCTS.PRODUCTID = REVIEWS.PRODUCTID
WHERE REVIEWS.RATING = 5;

 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
 SELECT FIRSTNAME AS 'FIRST NAME', EMPLOYEES.LASTNAME AS 'LAST NAME', SUM(SALES.QUANTITY) AS 'NUMBER OF SALES'
 FROM EMPLOYEES
 INNER JOIN SALES
 ON EMPLOYEES.EMPLOYEEID = SALES.EMPLOYEEID
 GROUP BY EMPLOYEES.EMPLOYEEID
 ORDER BY SUM(SALES.QUANTITY) DESC
 LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT DEPARTMENTS.NAME AS 'Department Name', CATEGORIES.NAME AS 'Category Name'
FROM DEPARTMENTS
INNER JOIN CATEGORIES
ON DEPARTMENTS.DEPARTMENTID = CATEGORIES.DEPARTMENTID
WHERE CATEGORIES.NAME = 'Appliances' OR CATEGORIES.NAME = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT PRODUCTS.NAME AS 'Product', SUM(SALES.QUANTITY) AS 'Total Units Sold', 
 SUM(SALES.QUANTITY * SALES.PRICEPERUNIT) AS 'Total Price'
 FROM PRODUCTS
 INNER JOIN SALES
 ON SALES.PRODUCTID = PRODUCTS.PRODUCTID
 WHERE PRODUCTS.PRODUCTID = 97; 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT PRODUCTS.NAME, REVIEWS.REVIEWER, REVIEWS.RATING, REVIEWS.COMMENT
FROM PRODUCTS
INNER JOIN REVIEWS
ON REVIEWS.PRODUCTID = PRODUCTS.PRODUCTID
WHERE PRODUCTS.PRODUCTID = 857 AND REVIEWS.RATING = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT EMPLOYEES.EMPLOYEEID, EMPLOYEES.FIRSTNAME, EMPLOYEES.LASTNAME, PRODUCTS.NAME,
SUM(SALES.QUANTITY) AS 'Total Sold'
FROM SALES
INNER JOIN EMPLOYEES
ON EMPLOYEES.EMPLOYEEID = SALES.EMPLOYEEID
INNER JOIN PRODUCTS
ON PRODUCTS.PRODUCTID = SALES.PRODUCTID
GROUP BY EMPLOYEES.EMPLOYEEID, PRODUCTS.PRODUCTID
ORDER BY EMPLOYEES.FIRSTNAME;
