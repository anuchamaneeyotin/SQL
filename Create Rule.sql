CREATE RULE OrderDate_rule as 

@CreateDate >= GETDATE()


EXEC sp_bindrule 'OrderDate_rule','dbo.CO.CreateDate'

EXEC sp_unbindrule 'dbo.CO.CreateDate'
