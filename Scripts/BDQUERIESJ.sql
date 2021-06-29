-- Select all products purchased by a Customer, ordered by 'Charged Price'.
-- Use an existing customer with at least 5 sales as an example.

SELECT P.Bar_Code , P.Model, R.Total
FROM Product AS P
INNER JOIN(
					SELECT(S.id, S.Total, C.Id)
							FROM Sale AS S
								INNER JOIN Costumer AS C
										ON S.Costumer_Id = C.id
                                             WHERE R.Id = 1 ) AS R
						ON P.Sale_Id = R.Id
                        ORDER BY (R.Total);
                        

-- Function to calculate the sum total spent by a Customer (from all of his purchases) divided by number of purchases. 
-- Calculates average of total spent by a customer.

SELECT AVG(R.Total), R.Id
-- Ainda falta por aquilo de selacionarmos o costumer que queremos
FROM (
					SELECT(S.Id, S.Total)
							FROM Sale AS S
								INNER JOIN Costumer AS C
										ON S.Costumer_Id = C.id) AS R
                                        WHERE id = 1;
                                        
   -- View of all product types and how many products of that type were sold (count), 
   -- ordered by decreasing number of items sold.     
SELECT ProductType , COUNT(ProductType) AS  Numero
	FROM Product	
		WHERE  Sale_Id IS NOT NULL
        GROUP BY Product_Type
        ORDER BY  Numero DESC;
          
          
--  Show all customers form a city. Use City.Id=1  
SELECT  R.First_Name ,R.Last_Name
FROM(
SELECT  C.First_Name , C.Last_Name, Adress.City_Id
FROM Adress
INNER JOIN Customer AS C ON Adress.Id = C.Adress_Id) AS R
WHERE R.City_Id = 1 ;




-- Show all customers born in the new millennium '2000/0/0'

SELECT  First_Name ,Last_Name
FROM Costumer
WHERE Date_of_Birth >  '2000/0/0';

-- Show all the products in a sale, use Sale_Id=1

SELECT  *
FROM Product
WHERE Sale_Id =1;


-- Show Phone number, first name, last name, Brand, Model, Product_Type and Returned_Date 
-- from a Return made by a Customer of a Product. 
-- Use Returned_Id=8. Will need to join 4 tables

SELECT   C.First_Name, R2.Last_Name, R2.Brand, R2.Product_Type, R2.Date_Returned
FROM Costumer  AS C
INNER JOIN  (SELECT   R.Costumer_Id , R.Date_Returned,  P.Brand, P.Product_Type
 FROM  Product AS P
 INNER JOIN Returned AS R
ON R.Product_Bar_Code=P,Bar_Code
WHERE R.Id =8 ) AS R2
ON  R2.Costumer_ID = C.Id;