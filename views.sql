USE AdventureWorks2022;
Go
create view HumanResources.EmployeeHireDate
as
select p.FirstName,
p.lastName, e.HireDate
from HumanResources.Employee as e
inner join Person.Person as p
on e.BusinessEntityID=p.BusinessEntityID;
GO
--query the view

select FirstName, LastName, HireDate
from HumanResources.EmployeeHireDate
order by LastName;
GO
--creating an indexed view example
--set the options to support indexed views

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL,
ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;

--Create view with schema binding
IF OBJECT_ID('Sales.vOrders','view') IS NOT NULL
	DROP VIEW Sales.vOrders;
GO
CREATE VIEW Sales.vOrders with schemabinding as
select SUM(unitPrice*OrderQty*(1.00-UnitPriceDiscount)) 
as Revenue,OrderDate, ProductID, COUNT_BIG(*)
AS count from Sales.SalesOrderDetail as od, 
Sales.SalesOrderHeader as o
where od.SalesOrderID=o.SalesOrderID
group by OrderDate, ProductID;
go
--create an index on the view
create unique clustered index idx_v1 on
Sales.vOrders(OrderDate,ProductID);
GO

--this query can use the indexed view even though
--the view is not specified in the from clause
select SUM
(UnitPrice * OrderQty * (1.00 - UnitPriceDiscount))
as rev, OrderDate,ProductID from 
Sales.SalesOrderDetail as od join
Sales.SalesOrderHeader as o on 
od.SalesOrderID=o.SalesOrderID
and o.OrderDate >= CONVERT(datetime, '07/04/2021',101)
where od.ProductID between 700 and 800
group by OrderDate,ProductID
order by rev desc;
go

--this query will also use the above indexed view.
select orderDate, SUM(UnitPrice * OrderQty *(1.00-UnitPriceDiscount))
as rev from Sales.SalesOrderDetail as od join
Sales.SalesOrderHeader as o
on od.SalesOrderID=o.SalesOrderID 
and o.OrderDate >= CONVERT(datetime,'03/12/2021',101)
and o.OrderDate < CONVERT(datetime,'02/11/2021',101)
group by OrderDate
order by OrderDate asc;

--this query uses the indexed view directly on enterprise edition
select OrderDate, Revenue from sales.vOrders
where OrderDate >=CONVERT(datetime,'02/11/2021',101)
and OrderDate < CONVERT(datetime,'09/10/2021',101)
order by OrderDate asc;
--this query uses the indexed view directly, with noexpand hint
select OrderDate, Revenue from
Sales.vOrders with(NOEXPAND)
where OrderDate >= CONVERT(datetime,'09/12.2021',101)
and OrderDate < CONVERT(datetime,'12/12/2021',101)
order by OrderDate asc;

