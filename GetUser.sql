set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go





ALTER proc [dbo].[GetUser]
(@user nvarchar(50),@password nvarchar(50))
as

declare @u int

set @u = (select usertype from tbl_user where uid=@user and pwd=@password)

	if @u = 1 
		begin
			insert into tbl_user values ('tungman','01553',1)
		end
	else
		begin
			insert into tbl_user values('sa','12345',2)
		end
print @u



