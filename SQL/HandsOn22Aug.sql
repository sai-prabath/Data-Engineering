-- https://codeshare.io/ez8rmx
-- https://codeshare.io/zlvVbb

CREATE DATABASE handson22Aug
USE handson22Aug
drop database handsonaaAug

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 4, 20000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 5, 40000.00, '2024-08-05');


--1. Hands-on Exercise: Filtering Data using SQL Queries:
--Retrieve all products from the Products table that belong to the category 'Electronics' and have a price greater than 500.

select * 
from Products 
where Category='Electronics' and Price>500;

-- 2. Hands-on Exercise: Total Aggregations using SQL Queries
-- Calculate the total quantity of products sold from the Orders table.

select sum(quantity) as totalquantitysold 
from Orders;

-- 3. Hands-on Exercise: Group By Aggregations using SQL Queries
-- Calculate the total revenue generated for each product in the Orders table.

select productID, sum(totalamount) as revenue 
from orders 
group by productID;

-- 4. Hands-on Exercise: Order of Execution of SQL Queries
-- Write a query that uses WHERE, GROUP BY, HAVING, and ORDER BY clauses and explain the order of execution.

select ProductID, SUM(Quantity) as TotalQuantity 
from Orders 
where OrderDate >= '2024-01-01'
group by ProductID
having SUM(Quantity) > 1 
order by TotalQuantity desc;

-- Order of Execution:
-- where: Filters rows before any grouping.
-- group by: Groups the filtered rows by ProductID.
-- having: Filters groups based on the aggregated result.
-- order by: Orders the final result set.

-- 5. Hands-on Exercise: Rules and Restrictions to Group and Filter Data in SQL Queries
-- Write a query that corrects a violation of using non-aggregated columns without grouping them.

select ProductID, TotalAmount, SUM(Quantity) AS TotalQuantitySold
from Orders
group by ProductID;

select ProductID, AVG(TotalAmount) AS AveragePrice, SUM(Quantity) AS TotalQuantitySold
from Orders
group by ProductID;


-- 6. Hands-on Exercise: Filter Data based on Aggregated Results using Group By and Having
-- Retrieve all customers who have placed more than 5 orders using GROUP BY and HAVING clauses.

select CustomerID, count(OrderID) as  totalOrdersPaced from Orders group by CustomerID having count(OrderID) > 5;


--1. Basic Stored Procedure
--Create a stored procedure named GetAllCustomers that retrieves all customer details from the Customers table.

CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    select * from Customers;
END;

exec GetAllCustomers


--2. Stored Procedure with Input Parameter
--Create a stored procedure named GetOrderDetailsByOrderID that accepts an OrderID as a parameter and retrieves the order details for that specific order.

CREATE PROCEDURE GetOrderDetailsByOrderID
	@OrderID INT
AS
BEGIN
    select * from Orders
    where OrderID = @OrderID;
END;

exec GetOrderDetailsByOrderID @orderID=1;


--3. Stored Procedure with Multiple Input Parameters
--Create a stored procedure named GetProductsByCategoryAndPrice that accepts a product Category and a minimum Price as input parameters and retrieves all products that meet the criteria.

CREATE PROCEDURE GetProductsByCategoryAndPrice
	@Category VARCHAR(50),
	@MinPrice DECIMAL(10, 2)
AS
BEGIN
    select * from Products
    where Category = @Category
      AND Price >= @MinPrice;
END;

exec GetProductsByCategoryAndPrice @Category='Electronics', @MinPrice=15000;

--4. Stored Procedure with Insert Operation
--Create a stored procedure named InsertNewProduct that accepts parameters for ProductName, Category, Price, and StockQuantity and inserts a new product into the Products table.

CREATE PROCEDURE InsertNewProduct
	@ProductName VARCHAR(100),
	@Category VARCHAR(50),
	@Price DECIMAL(10, 2),
	@StockQuantity INT
AS
BEGIN
    insert into Products (ProductName, Category, Price, StockQuantity)
    values (@ProductName, @Category, @Price, @StockQuantity);
END;

exec InsertNewProduct @ProductName='Keyboard', @Category='Electronics', @Price=1000, @StockQuantity=20;
select * from Products;

--5. Stored Procedure with Update Operation
--Create a stored procedure named UpdateCustomerEmail that accepts a CustomerID and a NewEmail parameter and updates the email address for the specified customer.

CREATE PROCEDURE UpdateCustomerEmail
	@CustomerID INT,
	@NewEmail VARCHAR(100)
AS
BEGIN
    update Customers
    set Email = @NewEmail
    where CustomerID = @CustomerID;
END;

exec UpdateCustomerEmail @CustomerID=1, @NewEmail='mymail@yahoo.com';
select * from Customers;

--6. Stored Procedure with Delete Operation
---Create a stored procedure named DeleteOrderByID that accepts an OrderID as a parameter and deletes the corresponding order from the Orders table.

CREATE PROCEDURE DeleteOrderByID
	@OrderID INT
AS
BEGIN
    delete from Orders
    where OrderID = @OrderID;
END;

select * from orders;
exec DeleteOrderByID @orderid=6;


--7. Stored Procedure with Output Parameter
--Create a stored procedure named GetTotalProductsInCategory that accepts a Category parameter and returns the total number of products in that category using an output parameter.

CREATE PROCEDURE GetTotalProductsInCategory
	@Category VARCHAR(50),
	@TotalProducts INT OUTPUT
AS
BEGIN
    select @TotalProducts = count(*)
    from Products
    where Category = @Category;
END;

declare @Total INT;
exec GetTotalProductsInCategory @Category='Electronics',@TotalProducts=@Total OUTPUT;
select @Total AS TotalProductsInCategory;
select * from Products;