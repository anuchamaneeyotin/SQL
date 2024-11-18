select YEAR(scdate) AS YearSell,COUNT(SCNO) Total from master_Sc01  GROUP BY YEAR(SCDATE)
 ORDER BY YEAR(SCDATE) OPTION(keep plan,hash group)


select * from finishgood_view_detail 
where in_date <= '2010-9-4' and out_date >= '2010-9-4'
and WHType ='Local'
OPTION(KEEPFIXED PLAN )