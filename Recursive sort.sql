

-- Query
with x 
as
(
SELECT
CAST(A.OBJT_SN AS NVARCHAR(100)) AS Code,
CAST(A.OBJT_NA3 AS NVARCHAR(100)) AS Name,
CAST('' AS NVARCHAR(100)) AS N,
cast('' as nvarchar(100)) as Tablename,
1 AS Level,
CAST(A.OBJT_NA3 AS NVARCHAR(200)) AS Sort
FROM OBJT A
WHERE A.SYST_NO = 'MIS' and A.OBJT_NO IN ('011000','012000','013000','014000','015000')
and A.OBJT_USE=1 AND A.OBJT_NA3 <> '---------------------------'
UNION ALL

SELECT
CAST(B.OBJT_SN AS NVARCHAR(100)) AS Code,
Convert(NVARCHAR(100),REPLICATE(' + ',x.Level) + B.OBJT_NA3) AS NAME,
CAST('' AS NVARCHAR(100)) AS N,
CAST('' AS NVARCHAR(100)) AS Tablename,
x.Level +1 AS Level,
CAST(x.Sort + ' ' + B.OBJT_SN AS NVARCHAR(200)) AS Sort
FROM OBJT B
join x on B.OBJT_SN1 = x.Code
WHERE  B.OBJT_USE=1 AND B.OBJT_NA3 <> '---------------------------'
) 
SELECT * FROM x order by Sort
option (maxrecursion 0)