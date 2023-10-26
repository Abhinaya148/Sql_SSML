--Surabhi Abhinaya 1033326
--problem 1
select name,ListPrice from Production.Product;
go

--problem 2
SELECT p.FirstName,p.LastName,e.EmailAddress,a.City INTO Customer
FROM Person.Person p
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
JOIN Person.Address a ON p.BusinessEntityID = a.AddressID
JOIN Sales.Customer c ON p.BusinessEntityID = c.PersonID;

select firstname, lastname,EmailAddress,City from Customer where city='seattle';


--problem 3
SELECT p.Name AS ProductName, SUM(sod.OrderQty * sod.UnitPrice) AS TotalSalesAmount
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE p.ProductID = 793
GROUP BY p.Name;

--problem 4
select p.FirstName,p.LastName,h.JobTitle from HumanResources.Employee h
join Person.Person p on h.BusinessEntityID=p.BusinessEntityID
order by h.JobTitle;

--problem 5
SELECT p.Name as ProductName, sod.OrderQty
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE soh.CustomerID = 29485;

--problem 6
select soh.SalesOrderNumber as OrderNumber,soh.OrderDate as OrderDate, p.LastName as CustomerName
from Sales.SalesOrderHeader soh
join Person.Person p on soh.SalesOrderID=p.BusinessEntityID
join HumanResources.Employee h on p.BusinessEntityID=h.BusinessEntityID
where soh.SalesOrderID=276;

--problem 7
select p.FirstName as FirstName, p.LastName as LastName,e.EmailAddress as EmailAddress from Person.Person p
left join Sales.SalesOrderHeader soh on p.BusinessEntityID=soh.CustomerID
join person.Emailaddress e on p.BusinessEntityID=e.BusinessEntityID
where soh.PurchaseOrderNumber is null;

--problem 8

select Production.ProductCategory.Name as CategoryName,
    AVG(Sales.SalesOrderDetail.OrderQty * Sales.SalesOrderDetail.UnitPrice) as AverageSalesAmount
from Production.ProductCategory
join Production.ProductSubcategory on Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID
join Production.Product on Production.ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID
join Sales.SalesOrderDetail on Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
group by Production.ProductCategory.Name;

--problem 9

select  top 10 p.name as ProductName, SUM(sod.OrderQty) as QuantitySold from Production.Product p
join Sales.SalesOrderDetail sod on p.ProductID=sod.ProductID
group by p.Name
order by QuantitySold desc

--problem 10

select soh.salesOrderID as Order_no,soh.ShipDate as Ship_Dates from Sales.SalesOrderHeader soh
where soh.ShipDate < soh.DueDate;

