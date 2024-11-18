
DROP TABLE #TEMP

select 

SalesOrderID,
[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],
[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31]  INTO #TEMP from
(
select 

	h.SalesOrderID,
	p.name as Productname,
	MONTH(h.orderdate) AS M

	from Production.Product as p
	inner join 
	Sales.SalesOrderDetail as s
	INNER JOIN Sales.SalesOrderHeader as h
	on s.SalesOrderID = h.SalesOrderID
	ON p.ProductID = s.ProductID
	where YEAR(h.Orderdate) = 2001 and MONTH(h.Orderdate) = 7
) as t
PIVOT
(
	COUNT(Productname)
FOR M in 
(
	[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],
[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31] 
) 
)as PVT ;

SELECT * FROM #TEMP

--SELECT 
--CASE WHEN (GROUPING(SalesOrderID)=1) THEN
--500000
--ELSE
--ISNULL(SalesOrderID,60000)
--end as ID,
--SUM([7]) AS [7]
--
--
--FROM #TEMP
--
--GROUP BY SalesOrderID WITH ROLLUP


