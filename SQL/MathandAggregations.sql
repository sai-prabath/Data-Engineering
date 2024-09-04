
create database company
use company

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name NVARCHAR(100) NOT NULL,
    location NVARCHAR(100),
    budget DECIMAL(15, 2),
    manager_id INT,
    established_date DATE,
    active BIT,
    floor_number INT,
    phone_number CHAR(10),
    website_url NVARCHAR(255)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number CHAR(10),
    hire_date DATE,
    job_title NVARCHAR(100),
    salary DECIMAL(15, 2),
    department_id INT,
    is_full_time BIT,
    date_of_birth DATE,
    address NVARCHAR(MAX),
    gender CHAR(1),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name, location, budget, manager_id, established_date, active, floor_number, phone_number, website_url)
VALUES 
(1, 'Human Resources', 'New York', 100000.00, NULL, '2010-03-15', 1, 5, '1234567890', 'http://hr.example.com'),
(2, 'Finance', 'San Francisco', 250000.00, NULL, '2015-07-20', 1, 10, '0987654321', 'http://finance.example.com'),
(3, 'IT', 'Chicago', 500000.00, NULL, '2005-12-01', 1, 3, '1112233445', 'http://it.example.com'),
(4, 'Marketing', 'Los Angeles', 150000.00, NULL, '2018-06-10', 1, 7, '5556667777', 'http://marketing.example.com'),
(5, 'Sales', 'Boston', 200000.00, NULL, '2020-01-25', 1, 8, '4445556666', 'http://sales.example.com'),
(6, 'Customer Support', 'Seattle', 120000.00, NULL, '2016-08-14', 1, 6, '6667778888', 'http://support.example.com'),
(7, 'Research and Development', 'San Diego', 300000.00, NULL, '2012-11-22', 1, 9, '7778889999', 'http://rd.example.com'),
(8, 'Legal', 'Austin', 180000.00, NULL, '2017-05-10', 1, 4, '8889990000', 'http://legal.example.com'),
(9, 'Administration', 'Philadelphia', 200000.00, NULL, '2019-01-01', 1, 2, '9990001111', 'http://admin.example.com'),
(10, 'Logistics', 'Denver', 160000.00, NULL, '2021-03-12', 1, 6, '0001112222', 'http://logistics.example.com'),
(11, 'Quality Assurance', 'Miami', 220000.00, NULL, '2022-07-25', 1, 8, '1112223333', 'http://qa.example.com'),
(12, 'Design', 'Atlanta', 130000.00, NULL, '2013-09-18', 1, 5, '2223334444', 'http://design.example.com'),
(13, 'Strategy', 'Dallas', 250000.00, NULL, '2011-04-20', 1, 7, '3334445555', 'http://strategy.example.com'),
(14, 'Procurement', 'San Jose', 170000.00, NULL, '2014-12-01', 1, 3, '4445556666', 'http://procurement.example.com'),
(15, 'Training', 'San Antonio', 140000.00, NULL, '2019-11-18', 1, 4, '5556667777', 'http://training.example.com'),
(16, 'Business Development', 'San Francisco', 190000.00, NULL, '2021-05-05', 1, 6, '6667778888', 'http://businessdev.example.com'),
(17, 'Operations', 'Los Angeles', 210000.00, NULL, '2022-06-23', 1, 7, '7778889999', 'http://operations.example.com'),
(18, 'Innovation', 'Seattle', 280000.00, NULL, '2018-03-10', 1, 8, '8889990000', 'http://innovation.example.com'),
(19, 'Engineering', 'Chicago', 320000.00, NULL, '2020-10-15', 1, 5, '9990001111', 'http://engineering.example.com'),
(20, 'Finance Operations', 'New York', 260000.00, NULL, '2023-01-29', 1, 9, '0001112222', 'http://financeops.example.com');



INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_title, salary, department_id, is_full_time, date_of_birth, address, gender)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '5551234567', '2020-01-15', 'Software Engineer', 80000.00, 3, 1, '1985-05-12', '123 Elm Street, Springfield, IL', 'M'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '5552345678', '2019-06-22', 'HR Manager', 95000.00, 1, 1, '1990-11-20', '456 Oak Avenue, New York, NY', 'F'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '5553456789', '2021-09-30', 'Financial Analyst', 70000.00, 2, 1, '1988-03-14', '789 Pine Road, San Francisco, CA', 'F'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '5554567890', '2022-02-01', 'Sales Executive', 60000.00, 5, 1, '1983-07-23', '321 Maple Street, Boston, MA', 'M'),
(5, 'Emma', 'Wilson', 'emma.wilson@example.com', '5555678901', '2023-07-17', 'Marketing Specialist', 65000.00, 4, 1, '1992-09-30', '654 Cedar Avenue, Los Angeles, CA', 'F'),
(6, 'Michael', 'Green', 'michael.green@example.com', '5556789012', '2020-05-18', 'Product Manager', 85000.00, 7, 1, '1982-02-20', '456 Birch Road, San Diego, CA', 'M'),
(7, 'Linda', 'Lee', 'linda.lee@example.com', '5557890123', '2019-08-15', 'Legal Advisor', 90000.00, 8, 1, '1985-06-25', '789 Maple Street, Austin, TX', 'F'),
(8, 'James', 'Miller', 'james.miller@example.com', '5558901234', '2021-11-23', 'Administrative Assistant', 70000.00, 9, 1, '1986-09-10', '123 Pine Avenue, Philadelphia, PA', 'M'),
(9, 'Patricia', 'Davis', 'patricia.davis@example.com', '5559012345', '2022-01-10', 'Logistics Coordinator', 72000.00, 10, 1, '1989-12-05', '456 Cedar Lane, Denver, CO', 'F'),
(10, 'Robert', 'Garcia', 'robert.garcia@example.com', '5560123456', '2023-07-30', 'Quality Manager', 95000.00, 11, 1, '1990-03-22', '789 Willow Street, Miami, FL', 'M'),
(11, 'Susan', 'Rodriguez', 'susan.rodriguez@example.com', '5561234567', '2018-04-12', 'Design Lead', 80000.00, 12, 1, '1991-07-15', '123 Elm Street, Atlanta, GA', 'F'),
(12, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '5562345678', '2020-09-21', 'Strategy Consultant', 93000.00, 13, 1, '1984-10-05', '456 Oak Drive, Dallas, TX', 'M'),
(13, 'Jessica', 'Martinez', 'jessica.martinez@example.com', '5563456789', '2017-12-03', 'Procurement Specialist', 78000.00, 14, 1, '1987-05-18', '789 Pine Road, San Jose, CA', 'F'),
(14, 'Christopher', 'Harris', 'christopher.harris@example.com', '5564567890', '2022-11-14', 'Training Coordinator', 71000.00, 15, 1, '1992-01-23', '123 Maple Street, San Antonio, TX', 'M'),
(15, 'Sarah', 'Clark', 'sarah.clark@example.com', '5565678901', '2021-06-17', 'Business Development Manager', 85000.00, 16, 1, '1985-08-27', '456 Cedar Avenue, San Francisco, CA', 'F'),
(16, 'William', 'Young', 'william.young@example.com', '5566789012', '2019-04-20', 'Operations Analyst', 87000.00, 17, 1, '1988-11-30', '789 Oak Street, Los Angeles, CA', 'M'),
(17, 'Karen', 'King', 'karen.king@example.com', '5567890123', '2020-10-22', 'Innovation Specialist', 95000.00, 18, 1, '1987-12-09', '123 Birch Road, Seattle, WA', 'F'),
(18, 'David', 'Wright', 'david.wright@example.com', '5568901234', '2022-03-05', 'Engineering Lead', 105000.00, 19, 1, '1991-04-14', '456 Maple Avenue, Chicago, IL', 'M'),
(19, 'Emily', 'Scott', 'emily.scott@example.com', '5569012345', '2021-08-16', 'Finance Operations Manager', 110000.00, 20, 1, '1986-07-19', '789 Elm Street, New York, NY', 'F'),
(20, 'Joshua', 'Turner', 'joshua.turner@example.com', '5570123456', '2019-05-11', 'Systems Analyst', 82000.00, 3, 1, '1984-11-29', '123 Willow Lane, Chicago, IL', 'M');


select budget, (budget*0.85) as dis, CEILING(budget*0.85) as ceilprice, FLOOR(budget*0.85) as floorprice from departments
select salary, ROUND(salary,2) as roundSalary from employees;
select salary, ceiling(salary) as ceilSalary from employees;
select salary, floor(salary) as floorSalary from employees;
select salary, sqrt(salary) as sqrtSalary from employees;
select salary, power(salary,2) as powSalary from employees;
select salary, salary%2 as modSalary from employees;
select salary, rand()*100 as IncreasedSalaryPercent from employees;
select salary, exp(salary) as exponentSalary from employees;
select salary, log(salary) as logarithmicSalary from employees;

create database shop;

-- procedures
CREATE PROCEDURE getemployees
AS
BEGIN
    SELECT*FROM employees;
END

exec getemployees;

-- procedure with multiple queries
CREATE PROCEDURE getemployeesanddepartments
AS
BEGIN
    SELECT*FROM employees;
	SELECT*FROM departments;
END

exec getemployeesanddepartments;

-- procedure with input attribute
CREATE PROCEDURE getEmployeeByID
	@employeeID INT
AS
BEGIN
    SELECT*FROM employees where employee_id = @employeeID;
END

exec getEmployeeByID @employeeID=2;

-- procedure with multiple input attributes:

CREATE PROCEDURE getEmployeeByIDandDepartment
	@employeeID INT,
    @departmentID INT
AS
BEGIN
    SELECT*FROM employees where employee_id = @employeeID AND department_id = @departmentID;
END

exec getEmployeeByIDandDepartment @employeeID=2, @departmentID=1;