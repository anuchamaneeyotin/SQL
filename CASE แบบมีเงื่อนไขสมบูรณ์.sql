set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go









ALTER PROC [dbo].[sp_FG_PackReport]

@sdate varchar(15),
@edate varchar(15),
@packno varchar(50)

WITH RECOMPILE
as 

SET NOCOUNT ON;

DECLARE @sql varchar(max);

set @sql = 'WITH CTE(Barcode, PackNo, PackDate, BatchNo, LotNo, Quality, Color1,LabCode1, SCNO,PieceNo, Grade, Kgs, Yds, Mtr,Rpt,fgin,indate,warehouse) as 

(
	SELECT  Barcode, PackNo, PackDate, BatchNo, LotNo, Quality, Color1,LabCode1, SCNO,PieceNo, Grade, Kgs, Yds, Mtr,Rpt,'''','''','''' FROM Packing_Summary  where PackDate BETWEEN ''' + @sdate  + ''' and ''' + @edate   + '''
) 
select 
CTE.Barcode, 
PackNo, 
PackDate, 
BatchNo, 
LotNo, 
Quality, 
Color1,
LabCode1, 
CTE.SCNO,
S.CUSTID,
PieceNo, 
Grade, 
Kgs, 
Yds, 
Mtr,
Rpt,
CASE 
WHEN EXISTS(SELECT TOP 1 BARCODE FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode) THEN ''รับเข้าแล้ว''
ELSE
''''
END AS FgIN,
CASE 
WHEN EXISTS(SELECT TOP 1 BARCODE FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode) THEN  (SELECT  TOP 1 LifeDate FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode)
ELSE
NULL
END AS INDATE,
CASE 
WHEN EXISTS(SELECT TOP 1 warehouse FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode) THEN (SELECT  TOP 1 warehouse FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode)
ELSE
''''
END AS warehouse
from CTE
LEFT JOIN MASTER_SC01 AS S on CTE.SCNO = S.SCNO
'

IF @packno <> ''
	begin
			set @sql = @sql + ' where PackNo=''' + @packno + ''''
	end

print(@sql)
exec(@sql)






















