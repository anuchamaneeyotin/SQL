select salesorderid,COUNT(productID) from Sales.SalesORDERDETAIL
GROUP BY Salesorderid
having salesorderid=43668