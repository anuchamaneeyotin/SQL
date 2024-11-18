

select * from Sales.SalesOrderDetail


select SalesOrderID,sum(Unitprice) over (partition by productID)
 from Sales.SalesOrderDetail
