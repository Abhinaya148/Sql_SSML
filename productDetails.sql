CREATE TABLE dbo.Products(
ProductID int PRIMARY KEY NOT NULL,
ProductName varchar(25) NOT NULL,
Price money NULL,
ProductDescription varchar(max) NULL)
GO
--Inserting data in table
INSERT dbo.Products(ProductID, ProductName,Price,ProductDescription) 
VALUES(10,'Clamp',12.48,'Workbench clamp')
GO
--or in another way
INSERT dbo.Products
VALUES(23,'TIRE Bar',NULL,'Tool for changing tires')
GO
--updating values in the table
UPDATE dbo.Products
SET ProductName='Flat Head Screwdriver'
WHERE ProductID=10
GO
--Reading all the data from table
SELECT * FROM Products
GO
--concatenation
SELECT CONCAT(ProductID, ProductName,Price) AS Result 
FROM dbo.Products

SELECT CONCAT('Happy ','Birthday ',NULL,11,':','25') AS Result;
--Replacing the strings
SELECT REPLACE('Workbench','ben','crun');
GO
--Reverse the strings
SELECT ProductName, REVERSE(ProductName) AS Result
FROM dbo.Products
--Date time functions
SELECT SYSDATETIME(),
SYSDATETIMEOFFSET(),
SYSUTCDATETIME(),
CURRENT_TIMESTAMP,
GETDATE(),
GETUTCDATE();

--Casting
SELECT CAST(10.45377 AS int) AS trunc1,
CAST(-12.723 AS int)AS trunc2,
CAST(10.423 AS numeric) AS round1,
CAST(-12.821 AS NUMERIC) AS round2;
--converting
SELECT CONVERT(date, SYSDATETIME()),
CONVERT(date,SYSDATETIMEOFFSET()),
CONVERT(date,SYSUTCDATETIME()),
CONVERT(date,CURRENT_TIMESTAMP),
CONVERT(date,GETDATE()),
CONVERT(date,GETUTCDATE());
GO

--PARSING
SELECT PARSE('Monday, 13 December 2001' AS datetime USING 'en-us') AS Result;


SET LANGUAGE 'English';
SELECT PARSE('12/16/2010' AS datetime) AS Result;
GO
--try convert
SET DATEFORMAT mdy;
SELECT TRY_CONVERT(datetime2,'09/23/2002') AS Result;
GO
--power values
DECLARE @input1 FLOAT;
DECLARE @input2 FLOAT;
SET @input1=2;
SET @input2=2.5;
SELECT POWER(@input1, 3) AS Result1, POWER(@input2,3) AS Result2;
-- using round to get the specified length
SELECT ROUND(123.9994,3), ROUND(123.9995,3);
GO
--ceiling- returns smaller number
SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0);
GO
--floor returns largest integer
SELECT FLOOR(123.45), FLOOR(-123.45),FLOOR($123.45);
GO
--EXP-returns exponential value
DECLARE @var FLOAT
DECLARE @Result varchar(200)
SET @var=30
SELECT 'The EXP of the variable is:' + CONVERT(varchar,EXP(@var)) as Result;
--View list of databases 
SELECT name, database_id, create_date FROM sys.databases;
GO
--schemas
CREATE SCHEMA Chains;
GO
CREATE TABLE Chains.Sizes(ChainID int, width dec(10,2));
EXEC sp_rename 'dbo.ErrorLog.ErrorTime','ErrorDateTime','COLUMN';
