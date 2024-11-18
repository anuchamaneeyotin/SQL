
select ISNULL(MAX(CAST(SUBSTRING(orderid,6,5) AS int)),0) as OrderID from tbl_order