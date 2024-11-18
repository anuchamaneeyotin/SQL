USE AdventureWorks;
GO
WITH OrderedOrders AS
(SELECT SalesOrderID, OrderDate,
ROW_NUMBER() OVER (order by OrderDate)as RowNumber
FROM Sales.SalesOrderHeader ) 
SELECT * 
FROM OrderedOrders 
WHERE RowNumber between 60 and 70;
