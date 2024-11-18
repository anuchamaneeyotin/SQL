
select * from  OPENQUERY(OLE,'select * from tbl_user')

if EXISTS(select * from  OPENQUERY(OLE,'select * from ole.tbl_user') except select * from tbl_user) 
insert into tbl_user(uid,pwd,usertype) select * from  OPENQUERY(OLE,'select * from ole.tbl_user') except select * from tbl_user

SELECT *
   FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0','C:\db2.mdb;',DB2)
GO


select * from OPENQUERY(TSDYESERVER,'select * from master_dyemachine where MCGroup=''Dye'' ')

declare @m as int

select @m = max(Capacity) from Master_DyeMachine where MCGroup='Dye'

print   @m

exec dbo.GetMax

select * from MASTER_dyemachine

INSERT INTO

tbl_mc(MCNo,MCId,MCGroup) 

SELECT * FROM OPENQUERY(TSDYESERVER,'select MCNo,MCId,MCGroup from Master_DyeMachine where MCGroup=''Dye''')

delete   from tbl_mc

exec InsertMC