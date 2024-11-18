--sp_dbcmptlevel 'TSDB_Main',90 

SELECT CustID,[1] as Jan,[2] as Feb,[3] as Mar,[4] as Apr,[5] as May, 
[6] as June,[7] as July,[8] as Aug,[9] as Sep,[10] as Oct,[11] as Nov,[12] as Dec
FROM 
(SELECT SCNO as s,CustID,MONTH(Scdate) as M  from Master_SC01 where YEAR(Scdate) = 2009) as P
PIVOT
(
	     COUNT(s)
FOR M IN
([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] )
) as PVT
order by CustID


