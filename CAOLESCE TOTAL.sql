SELECT COALESCE(c.CategoryName ,'Total') [ CaotegoryName],
COUNT(p.productID) as TotalProduct,
SUM(UNITSINSTOCK) AS Quantity
FROM PRODUCTS as p
INNER MERGE JOIN Categories as C on p.CategoryID = C.categoryID 
GROUP BY c.CategoryName with ROLLUP OPTION ( HASH GROUP )