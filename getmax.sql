set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go




ALTER proc [dbo].[GetMax]

as 

declare @m as int
-- นี่เเป็นแบบวิธีการ Set ตัวแปรแค่ตัวเดียว
--set @m=(select M from openquery(TSDYESERVER,'SELECT Max(Capacity) as M from Master_DyeMachine where MCGroup=''Dye'''))

select @m = M from openquery(TSDYESERVER,'SELECT Max(Capacity) as M from Master_DyeMachine where MCGroup=''Dye''')
print @m 






















