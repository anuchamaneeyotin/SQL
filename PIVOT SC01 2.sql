
select Brand,[2008],[2009],[2010] from
(
	select  Brand,scno as C,YEAR(scdate) as Y from master_sc01 where Brand IN ('ADIDAS','ADIDAS REEBOK SALESMAN','mizuno','NTS','OLDO','ADIDAS SALESMAN')
)
 as p 
PIVOT
(
	COUNT(C) 
for Y in ([2008],[2009],[2010])
)
as pvt
