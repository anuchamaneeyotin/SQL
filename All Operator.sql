
-- �Ҥ�ҷ�������������ա���ҧ
select * from sales.Customer where CustomerID 
<> all
(select CustomerID from Sales.SalesOrderHeader)

select CustomerID from Sales.SalesOrderHeader where CustomerID=13