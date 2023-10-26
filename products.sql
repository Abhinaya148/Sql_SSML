CREATE TABLE ProductTask(
ProductID int PRIMARY KEY,
ProductTitle varchar(50) NOT NULL,
Price int,
ProductDescription varchar(max)
)
GO

INSERT dbo.ProductTask
VALUES(20, 'soap', 350,'used to body')
GO
INSERT dbo.ProductTask
VALUES(21, 'Oil',176, 'care for hair')
GO
INSERT dbo.ProductTask
VALUES(22,'milk',40, 'for children')
GO
INSERT dbo.ProductTask
VALUES(24,'chocolates',80,'for me')
GO
INSERT dbo.ProductTask
VALUES(25, 'Egg',7,'gives protein')
GO

ALTER TABLE dbo.ProductTask
Alter column Price int not null;
GO
SELECT * FROM dbo.ProductTask
GO

CREATE TABLE ProductCategories(
ProductName varchar(50)  PRIMARY KEY,
SubName varchar(50),
ExpiryDate date not null)
GO

INSERT dbo.ProductCategories 
VALUES('Milk','Cinthol','08-08-1943')
Go
INSERT dbo.ProductCategories
VALUES('chocolate','Dettol','12-13-2001')
GO
INSERT dbo.ProductCategories
VALUES('Egg','Santoor','04-26-1265')
GO

INSERT dbo.ProductCategories
VALUES('Egg','parachute','07-29-1256')
GO
INSERT dbo.ProductCategories
VALUES('Oil','Vatika','11-21-1347')
GO


SELECT * FROM dbo.ProductCategories
GO

--SELECT * FROM dbo.ProductTask, dbo.ProductCategories
--GO

ALTER TABLE dbo.ProductTask
add constraint pk_ProductTask primary key(ProductTitle);

drop table dbo.ProductTask
Select * from dbo.pr