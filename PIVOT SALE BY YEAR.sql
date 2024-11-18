SELECT     pvt.[SalesPersonID], pvt.[FullName], pvt.[Title], pvt.[SalesTerritory], pvt.[2002], pvt.[2003], pvt.[2004]
FROM        
 (SELECT     soh.[SalesPersonID], c.[FirstName] + ' ' + COALESCE (c.[MiddleName], '') + ' ' + c.[LastName] AS [FullName], e.[Title], 
                                              st.[Name] AS [SalesTerritory], soh.[SubTotal], YEAR(DATEADD(m, 6, soh.[OrderDate])
) 
AS [FiscalYear]
                       FROM          [Sales].[SalesPerson] sp INNER JOIN
                                              [Sales].[SalesOrderHeader] soh ON sp.[SalesPersonID] = soh.[SalesPersonID] INNER JOIN
                                              [Sales].[SalesTerritory] st ON sp.[TerritoryID] = st.[TerritoryID] INNER JOIN
                                              [HumanResources].[Employee] e ON soh.[SalesPersonID] = e.[EmployeeID] INNER JOIN
                                              [Person].[Contact] c ON e.[ContactID] = c.ContactID
)
AS soh PIVOT 
(
SUM([SubTotal]) FOR [FiscalYear] IN ([2002], [2003], [2004])
) AS pvt;