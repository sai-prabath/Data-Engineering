exercise:

1. Calculate the total amount spent by each customer.

SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

2. Find customers who have spent more than $1,000 in total.

SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) > 1000;

3. Find Product Categories with More Than 5 Products

SELECT CategoryID, COUNT(ProductID) AS ProductCount
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 5;

4. Calculate the total number of products for each category and supplier combination.

SELECT 
    CategoryID, 
    SupplierID, 
    COUNT(ProductID) AS ProductCount
FROM Products
GROUP BY GROUPING SETS (
    (SupplierID), 
    (CategoryID)
);

5. Summarize total sales by product and customer, and also provide an overall total.

SELECT 
    CustomerID, 
    ProductID, 
    SUM(Amount) AS TotalSales
FROM Orders
GROUP BY GROUPING SETS (
    (CustomerID),
    (ProductID),
    ()
);