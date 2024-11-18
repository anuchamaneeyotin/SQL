DECLARE @sql nvarchar(1000),@u nvarchar(50)

set @u = '1,2,4'
SET NOCOUNT ON
set @sql = N'select * from tbl_user where usertype in (' + @u + ')'

select @sql
exec sp_executesql @sql

set @u = '''tungman'',''sa'''
SET NOCOUNT ON
set @sql = N'select * from tbl_user where uid in (' + @u + ')'
select @sql


exec sp_executesql @sql