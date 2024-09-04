create database shop
use shop

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE)
    
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price FLOAT)


INSERT INTO Orders (order_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2024-08-01'),
(2, 2, 1, '2024-08-02'),
(3, 3, 3, '2024-08-03'),
(4, 1, 1, '2014-03-04'),
(5, 4, 4, '2024-08-05'),
(6, 5, 2, '2014-03-06');

INSERT INTO Products (product_id, product_name, price, stock) VALUES
(1, 'Laptop', 88.00, 20),
(2, 'Smartphone', 500.00, 50),
(3, 'Tablet', 300.00, 30),
(4, 'Headphones', 50.00, 100),
(5, 'Monitor', 150.00, 40);


-- insert

CREATE PROCEDURE insertProduct
	@product_id INT,
	@product_name VARCHAR(100),
	@price FLOAT,
	@stock INT
AS
BEGIN
    INSERT INTO Products (product_id, product_name, price, stock) VALUES (@product_id, @product_name, @price, @stock);
END

exec insertProduct @product_id=6, @product_name="Keyboard", @price=80.00, @stock=20;
select * from products;

-- update
CREATE PROCEDURE updateProductPrice
	@product_id INT,
	@price FLOAT
AS
BEGIN
    UPDATE Products SET price=@price WHERE product_id=@product_id;
END

exec updateProductPrice @product_id=6, @price=85.00;
select * from products;

-- delete
CREATE PROCEDURE deleteProduct
	@product_id INT
AS
BEGIN
    DELETE FROM Products WHERE product_id=@product_id;
END

exec deleteProduct @product_id=6;
select * from products;

-- output
CREATE PROCEDURE getOrderedProducts
	@result VARCHAR(100) OUTPUT
AS
BEGIN
    select @result = p.product_name from Products p join Orders o ON o.product_id=p.product_id;
END

DECLARE @orderedPros VARCHAR(100);
exec getOrderedProducts @result = @orderedPros OUTPUT;
select @orderedPros as Ordered_Products;

select p.product_name from Products p join Orders o ON o.product_id=p.product_id

-- transacrion

CREATE PROCEDURE processOrder
	@order_id INT,
    @product_id INT,
    @quantity INT
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		Insert into Orders (order_id, product_id, quantity, order_date) VALUES(@order_id, @product_id, @quantity, GETDATE());
		update Products set stock = stock-@quantity where product_id = @product_id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
END;

exec processOrder @order_id=8,@product_id=5,@quantity=5;
select * from orders;
select * from products;

-- Add and UPDATE stock

CREATE PROCEDURE updateStock
	@product_id INT,
    @adjustment INT
AS
BEGIN
	if @adjustment > 0
	BEGIN
		update Products set stock = stock+@adjustment where product_id = @product_id;
	END
	ELSE IF @adjustment < 0
	BEGIN  
		update Products set stock = stock+@adjustment where product_id = @product_id;
	END 
END;

exec updateStock @product_id=5,@adjustment=3;
exec updateStock @product_id=5,@adjustment=-2;
select * from products;

