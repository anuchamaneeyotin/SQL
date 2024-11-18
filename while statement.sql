declare @x int,@x2 int

set @x = 1

begin tran
while @x < 79
begin
--print @x
set @x2 = (select MAX(ID) from master_Flow)+1
Insert into Master_Flow (ID,Measure,ProcessNo,ProcessName,GroupPart,Spec1,Spec2,Spec3,Tooling,Unit) 
VALUES(@x2,'TubeHole3',@x,@x,'PH',1.68,0.5,0.5,'Keyence IM6500','MM')
--print @x2
set @x = @x +1
end

SELECT * FROM master_Flow where Measure='TubeHole3'

rollback


commit 

