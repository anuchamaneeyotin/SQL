SELECT SalesOrderID,ProductID,ORDERQTY,
SUM(ORDERQTY) OVER(PARTITION BY SalesOrderID) as 'Total' from Sales.SalesOrderDetail
WHERE SalesOrderID IN(43659,43664)
