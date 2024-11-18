SELECT CASE WHEN (GROUPING(name) = 1) THEN 'ALL'
            ELSE ISNULL(name, 'UNKNOWN')
       END AS Item,
       SUM(reorderpoint) AS QtySum
FROM production.product
GROUP BY name WITH rollup
GO
