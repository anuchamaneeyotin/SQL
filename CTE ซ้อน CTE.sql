WITH CTE(Gsno,MC,dd) as 
(
	select GSNO,MC,DD from tbl_notifycalico
) ,a as 
(
	select * from CTE where MONTH(dd) >6
)
select * from a