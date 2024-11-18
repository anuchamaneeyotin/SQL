
select Brand,[2007],[2008],[2009],[2010] from
(
	select  Brand,scno as C,YEAR(scdate) as Y from master_sc01 where Brand <> '' 
)
 as p 
PIVOT
(
	 COUNT(C) 
for Y in ([2007],[2008],[2009],[2010])
)
as pvt  

where [2007] > 1000 order by brand



