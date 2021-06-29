Use Project_database;
-- How to organize our queries:
-- Write a description of what the query should do,
-- Complete/Not Complete
-- SQL code

-- ##################################
-- Quereies from relational algebra

-- ### QUERY 1
-- All of the sales associated with customer 1, and when they were made
-- Complete
select Sale.Id, Sale.Date_Sold from Customer inner join Sale on Customer.Id=Sale.Customer_Id
	where Customer.Id='1';

-- ### QUERY 2	
/*Show all customers form a city. Use City.Id=1  */
select Customer.First_Name, Customer.Last_Name from Customer inner join Address on Customer.Address_Id = Address.Id
	where Address.City_Id = 1;
/*
SELECT  R.First_Name ,R.Last_Name
FROM(
SELECT  C.First_Name , C.Last_Name, Address.City_Id
FROM Address
INNER JOIN customer AS C ON Address.Id = C.Address_Id) AS R
WHERE R.City_Id = 1 ;
*/
-- ### QUERY 3
/*Show all customers born in the new millennium '2000/0/0'  */
SELECT First_Name, Last_Name, Date_of_Birth FROM Customer WHERE Date_of_Birth > '2000/0/0';

-- ### QUERY 4
/*Show all the Products in a sale, use Sale_Id=1 */
SELECT Product.* FROM Product WHERE Sale_Id =1;

-- ##################################
-- Standard selects

select * from City;
select * from Address;
SELECT * FROM Customer;
SELECT * FROM Phone;
select * from Sale;
SELECT * FROM Product;
select * from Returned;

-- ##################################
-- Views

-- ### QUERY 5
/* Calculates the sum total spent by a Customer (from all of his purchases) divided by number of purchases. 
-- Calculates average of total spent by a customer*/
DROP VIEW IF EXISTS SumTotalCustomer;
CREATE VIEW SumTotalCustomer AS
SELECT AVG(Sale.Total), Sale.Id FROM Sale 
	INNER JOIN Customer ON Sale.Customer_Id = Customer.Id
		WHERE Customer.Id = 1;
        
-- ### QUERY 6
-- View of all Products for sale (not sold yet), ordered by 'Average Rating'
DROP VIEW IF EXISTS UnsoldProductOrd;
CREATE VIEW UnsoldProductOrd AS
	SELECT * FROM Product
		WHERE Sale_Id IS NULL
			ORDER BY Average_Rating;

-- ### QUERY 7
/*View of all Products that were returned and how many times each was returned (grouped with the same 'Product Type', 'Brand' and 'Model'), 
ordered by decreasing number of returns. Determines the worst quality Products*/
DROP VIEW IF EXISTS ReturnedProducts;
CREATE VIEW ReturnedProducts
AS
	SELECT P.Product_Type, P.Brand, P.Model, COUNT(*) FROM Returned AS R
    INNER JOIN Product AS P ON P.Bar_Code=R.Product_Bar_Code
		GROUP BY Product_Type, Brand, Model;


-- ### QUERY 8
/*View of all Product types and how many Products of that type were sold (count),ordered by decreasing number of items sold.*/ 
DROP VIEW IF EXISTS AllProductTypes;
CREATE VIEW AllProductTypes
AS
SELECT Product_Type , COUNT(Product_Type) AS Numero
	FROM Product WHERE Sale_Id IS NOT NULL
        GROUP BY Product_Type
        ORDER BY Numero DESC;
          

-- ### QUERY 9
/*Select all Products purchased by a Customer, ordered by 'Charged Price'.
Use an existing customer with at least 5 sales as an example*/
DROP VIEW IF EXISTS CustomerPurchases;
CREATE VIEW CustomerPurchases AS
SELECT P.Bar_Code , P.Model, S.Total FROM Product AS P 
	INNER JOIN Sale AS S ON P.Sale_Id = S.Id 
    INNER JOIN Customer AS C ON S.Customer_Id = C.Id
            WHERE S.Id = 1 ORDER BY (S.Total);
                        
-- ### QUERY 10                                     
/*  Show Phone number, first name, last name, Brand, Model, Product_Type and Returned_Date from a Return made by a Customer of a Product.  
Use Returned_Id=8.*/ 
DROP VIEW IF EXISTS ReturnedInfo;
CREATE VIEW ReturnedInfo AS
	SELECT C.First_Name, C.Last_Name, P.Brand, P.Product_Type, R.Date_Returned FROM Returned AS R
		INNER JOIN Product AS P on R.Product_Bar_Code=P.Bar_Code
			INNER JOIN Customer AS C ON R.Customer_Id = C.Id
					WHERE R.Id = 8 ;       
                                        	
-- ##################################
-- Functions

-- ### QUERY 11
/* Function to calculate the sum total spent by a Customer (from all of his purchases) divided by number of purchases.  Calculates average of total spent by a customer.*/ 
drop function averageSpent;
DELIMITER %%
create function averageSpent (Id int) returns double
READS SQL DATA
DETERMINISTIC
begin
	declare average double;
    select avg(Total) into average from Sale where Sale.Customer_Id=Id;
    return average;
end
%%
select averageSpent(2);

-- ignore this one
DROP VIEW IF EXISTS CustomerSpent;
CREATE VIEW CustomerSpent AS
SELECT AVG(R.Total), R.Id
-- Ainda falta por aquilo de selacionarmos o Customer que queremos
FROM (
					SELECT(S.Id, S.Total)
							FROM Sale AS S
								INNER JOIN Customer AS C
										ON S.Customer_Id = C.Id) AS R
                                        WHERE C.Id = 1;

/*Build a baller PC, show all the most expensive components in each Product type: 
select components by Product type: 'CPU', 'Motherboard', 'Case', 'Graphics Card', 'Sound Card', 'Cooling', 'Storage'. 
Order by decreasing Price, and show just the first row for each one*/
-- ### QUERY 12
SELECT Product_Type, Brand, Model, Color, MAX(Price) FROM Product
	WHERE Product.Sale_Id IS NULL
		GROUP BY Product_Type ORDER BY Price DESC;

-- SELECT @@sql_mode 
-- set sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'

-- ##################################
-- Transactions

-- ### QUERY 13
-- Register a new Sale
START TRANSACTION;
INSERT INTO Sale (Id, Total, Date_Sold, Customer_Id)
VALUES (21, 719.98, '2018/11/10', 10);
UPDATE Product 
	SET Product.Sale_Id = 21
	WHERE Product.Bar_Code = 23
	OR Product.Bar_Code = 26;
COMMIT;

-- ### QUERY 14
-- Insert a Product
START TRANSACTION;
INSERT INTO Product (Bar_Code, Product_Type, Brand, Model, 	Color, MSRP, Price, Release_Date, Average_Rating, Sale_Id, Aditional_Description)
VALUES (61,'Graphics Card','NVIDIA','GeForce GT 740M','Red', 49.99, 39.99,'2015/06/30',3.7, null, 'Cheap, not for gaming');
COMMIT;

-- ### QUERY 15
-- Insert a new Customer
-- With Address
START TRANSACTION;
INSERT INTO Address (Id , Postal_Code, Street, House_Number, City_Id)
VALUES (11,'4195-520', 'Rua ao lado da praia', 25, 7);
INSERT INTO Customer (Id, First_Name, Last_Name, Email, Date_of_Birth, NIB, Address_Id)
VALUES (16,'João','Só',	'sozinho@email.com','1994/11/10',214365879,11);
COMMIT;

-- ### QUERY 16
-- Register a return
START TRANSACTION;
INSERT INTO Returned (Id, Date_Returned, Product_Bar_Code, Sale_Id, Customer_Id)
VALUES	(11,'2018/11/20', 28, 10, 3);
UPDATE Product 
	SET Product.Sale_Id = null
	WHERE Product.Bar_Code = 28;
COMMIT;

-- ##################################
-- Procedures

drop procedure `Delete Sale`;

DELIMITER $$
CREATE PROCEDURE `Delete Sale`(Id INT)
BEGIN
	DELETE FROM Returned
    WHERE Returned.Sale_Id = Id;
    DELETE FROM Product
    WHERE Product.Sale_Id = Id;
	DELETE FROM Sale
    WHERE Sale.Id = Id;
END $$
DELIMITER ;

call `Delete Sale`(1);



-- ##################################
-- Users
DROP USER 'Employee'@'localhost';
CREATE USER 'Employee'@'localhost' identified by 'employee';
SET PASSWORD FOR 'Employee'@'localhost' = 'worker';
GRANT ALL PRIVILEGES ON Project_database.* TO 'Employee'@'localhost';
FLUSH PRIVILEGES;

DROP USER 'Customer'@'localhost';
CREATE USER 'Customer'@'localhost' identified by 'customer' WITH MAX_QUERIES_PER_HOUR 20;
SET PASSWORD FOR 'Customer'@'localhost' = '0000';
GRANT USAGE ON Project_database.Product TO 'Customer'@'localhost';
FLUSH PRIVILEGES;


/*###############################*/
