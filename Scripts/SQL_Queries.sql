Use Project_database;
-- How to organize our queries:
-- Write a description of what the query should do,
-- Complete/Not Complete
-- SQL code

-- ##################################
-- Quereies from relational algebra

-- All of the sales associated with customer 1, and when they were made
-- Complete
select Sale.Id, Sale.Date from Customer inner join Sale on Customer.Id=Sale.Customer_Id
	where Customer.Id='1';



-- ##################################
-- Standard selects



-- ##################################
-- Views



-- ##################################
-- Functions



-- ##################################
-- Transactions



-- ##################################
-- Triggers



-- ##################################
-- Users



-- ##################################