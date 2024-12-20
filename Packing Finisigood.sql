set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go




ALTER PROC [dbo].[sp_FG_PackReport_SUM]

@sdate varchar(15),
@edate varchar(15),
@packno varchar(50)

WITH RECOMPILE

as 

SET NOCOUNT ON;

DECLARE @sql varchar(max);

set @sql = 'WITH CTE(Barcode, PackNo, PackDate, BatchNo, LotNo, Quality, Color1,LabCode1, SCNO,PieceNo, Grade, Kgs, Yds, Mtr,Rpt,fgin,indate,warehouse) as 

(
	SELECT Barcode, PackNo, PackDate, BatchNo, LotNo, Quality, Color1,LabCode1, SCNO,PieceNo, Grade, Kgs, Yds, Mtr,Rpt,'''','''','''' FROM Packing_Summary  where PackDate BETWEEN ''' + @sdate  + ''' and ''' + @edate   + '''
) ,A AS (
select 
CTE.BARCODE as Barcode,
PackNo, 
PackDate, 
BatchNo, 
LotNo, 
Quality, 
Color1,
LabCode1, 
CTE.SCNO,
S.CUSTID,
Grade,
COUNT(CTE.BARCODE)  AS SUMBarcode,
SUM(KGS) AS SUMOfKgs,
SUM(YDS) AS SUMOfYds,
SUM(MTR) AS SUMOfMtr,
SUM(RPT) AS SUMOfRpt,
CASE 
WHEN EXISTS(SELECT TOP 1 BARCODE FROM MASTER_FINISHGOOD_TS1 WHERE barcode =CTE.barcode) THEN 1
ELSE
0 END
as FGIN
from CTE
LEFT JOIN MASTER_FINISHGOOD_TS1 AS T on T.barcode = CTE.BARCODE
LEFT JOIN MASTER_SC01 AS S on CTE.SCNO = S.SCNO
group by CTE.BARCODE,packno,packdate,batchno,lotno,Quality,Color1,Labcode1,CTE.SCNO,S.CUSTID,Grade )

SELECT 

PackNo, 
PackDate, 
BatchNo, 
LotNo, 
Quality, 
Color1,
LabCode1, 
SCNO,
CUSTID,
Grade,
COUNT(A.BARCODE) SUMbarcode,
SUM(SUMOfKgs) AS SumOfKgs,
SUM(SUMOfYds) AS SUMOfYds,
SUM(SUMOfMtr) AS SUMOfMtr,
SUM(SUMOfRpt) AS SUMOfRpt,
SUM(FGIN) as FGIN
FROM A
group by packno,packdate,batchno,lotno,Quality,Color1,Labcode1,SCNO,CUSTID,Grade
'

IF @packno <> ''
	begin
			set @sql = @sql + ' where PackNo=''' + @packno + ''''
	end

print(@sql)
exec(@sql)



