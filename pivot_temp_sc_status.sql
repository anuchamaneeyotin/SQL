--Select * from Temp_SC_Status where SCNO='TS-074653-10'
WITH cte(Brand,Jan,Feb,Mar,Apr,May,June,July,Aug,Sep,Oct,Nov,Dec) as (

select Brand,[1] as Jan,[2] as Feb,[3] as Mar,[4] as Apr,[5] as May, 
[6] as June,[7] as July,[8] as Aug,[9] as Sep,[10] as Oct,[11] as Nov,[12] as Dec

from 
(
	     -- Qty ต้องมาก่อนการวนค่า
	     select Brand,Qty,MONTH(OETC) AS M  from Temp_sc_status
) as p
pivot
(
	     sum(Qty)
for M in 
( [1],[2],[3],[4],[5] ,[6],[7],[8],[9],[10],[11],[12])
) as pvt
)
select cte.*,(select SUM(Qty) as Qty from Temp_SC_Status where Brand=cte.Brand) as TotalQty ,
(select sum(SQty) from Temp_SC_Status where Brand=cte.Brand) as TotalShipped,
(select sum(Balance1) from Temp_SC_Status where Brand=cte.Brand) as TotalBalance
from cte 



--select SUM(Qty) as Qty from Temp_SC_Status where Brand='ADIDAS'