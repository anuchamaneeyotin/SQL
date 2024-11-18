
select * from production.product as p;

with CTE(p1,p2) as 
(
select productid,name from production.product
)
select * from CTE inner join p on p.productid = CTE.p1

exec sp_help 'production.product'


select productid,name into product2 from production.product where productid < 500

select * from production.product where productid > all (select productid from product2)

select max(subtotal) from sales.salesorderheader