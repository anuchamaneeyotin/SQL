
select * from view_order

select * from customers c inner join orders o on c.customerid = o.customerid 
left join [order details] od on o.orderid = od.orderid

select * from customers c cross apply

(select * from orders od where od.customerid = c.customerid) as a cross apply

(select * from [order details]  o where o.orderid = a.orderid) as b cross apply

(select * from products p where p.productid = b.productid) as p 


USE AdventureWorks;
GO
WITH Sales_CTE (SalesPersonID, NumberOfOrders, MaxDate)
AS
(
    SELECT SalesPersonID, COUNT(*), MAX(OrderDate)
    FROM Sales.SalesOrderHeader
    GROUP BY SalesPersonID
)
SELECT E.EmployeeID, OS.NumberOfOrders, OS.MaxDate,
    E.ManagerID, OM.NumberOfOrders, OM.MaxDate
FROM HumanResources.Employee AS E
    JOIN Sales_CTE AS OS
    ON E.EmployeeID = OS.SalesPersonID
    LEFT OUTER JOIN Sales_CTE AS OM
    ON E.ManagerID = OM.SalesPersonID
ORDER BY E.EmployeeID;
GO

-- หาคนที่มีหัวหน้าพร้อมทั้งระบุ Level
USE AdventureWorks;
GO
WITH DirectReports(ManagerID, EmployeeID,  [name],EmployeeLevel) AS 
(
    SELECT ManagerID, EmployeeID,p.Firstname + ' ' + p.Lastname as  [name], 0 AS EmployeeLevel
    FROM HumanResources.Employee
INNER JOIN Person.Contact p on Employee.ContactID = p.ContactID
 WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.ManagerID, e.EmployeeID,p.Firstname + ' ' + p.Lastname as  [name],EmployeeLevel + 1
    FROM HumanResources.Employee e
        INNER JOIN DirectReports d 
        ON e.ManagerID = d.EmployeeID 
INNER JOIN Person.Contact p on e.ContactID = p.ContactID

)
SELECT ManagerID, EmployeeID, [name],EmployeeLevel 
FROM DirectReports  order by EmployeeLevel
GO


USE AdventureWorks;
GO
WITH DirectReports(Name, Title, EmployeeID, EmployeeLevel, Sort)
AS (SELECT CONVERT(varchar(255), c.FirstName + ' ' + c.LastName),
        e.Title,
        e.EmployeeID,
        1,
        CONVERT(varchar(255), c.FirstName + ' ' + c.LastName)
    FROM HumanResources.Employee AS e
    JOIN Person.Contact AS c ON e.ContactID = c.ContactID 
    WHERE e.ManagerID IS NULL
    UNION ALL
    SELECT CONVERT(varchar(255), REPLICATE ('| ' , EmployeeLevel) +
        c.FirstName + ' ' + c.LastName),
        e.Title,
        e.EmployeeID,
        EmployeeLevel + 1,
        CONVERT (varchar(255), RTRIM(Sort) + '| ' + FirstName + ' ' + 
                 LastName)
    FROM HumanResources.Employee as e
    JOIN Person.Contact AS c ON e.ContactID = c.ContactID
    JOIN DirectReports AS d ON e.ManagerID = d.EmployeeID
    )
SELECT EmployeeID, Name, Title, EmployeeLevel
FROM DirectReports 
ORDER BY Sort;
GO





USE AdventureWorks;
GO
SELECT * 
FROM Sales.Customer AS c
INNER JOIN Sales.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE TerritoryID = 5
OPTION (MERGE JOIN);
GO

use purchase
go
declare @pid as int,@unitid as int
set @pid=3
set @unitid=9
select * from tbl_item where productid=@pid and unitid=@unitid
OPTION ( OPTIMIZE FOR (@pid = 3,@unitid=9) )

USE AdventureWorks;
GO
SELECT SalesPersonID, CustomerID, OrderDate, SubTotal, TotalDue
FROM Sales.SalesOrderHeader
ORDER BY SalesPersonID, OrderDate 
COMPUTE SUM(SubTotal), SUM(TotalDue) BY SalesPersonID;


exec dbo.GetUser @user='mon',@password='12345'

-- OPENDATASOURCE ส่วนที่สำคัญจะต้อง
-- เขียนแบบนี้ databasename.dbo.tablename
declare @s nvarchar(50),@ds nvarchar(50)
set @ds = N'data source=MON;USER ID=sa;PASSWORD=01553;'
BEGIN TRY
insert into tbl_user 
select * 
from OPENDATASOURCE( 'SQLNCLI','data source=MON;USER ID=sa;PASSWORD=01553;')
.db1.dbo.tbl_user where usertypeID=1
END TRY
BEGIN CATCH
  EXECUTE usp_GetErrorInfo;
END CATCH

--USE [c:\MyNewDB.sdf]



