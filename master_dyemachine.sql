use TSDB_MAIN 

go

/* ------------------ returnorder -----------------------*/

select * from view_detailreturn where PLNO='PL-02090018'

/* -------------------end returnorder---------------------------------------*/
select * from master_dyemachine where mcgroup='Dye' compute sum(capacity)  

select * from master_dyemachinetype

select mctype,len(mctype) mc from master_dyemachine where mcno='J-15'

select *  from tbl_returnorder where docid LIKE 'RT10%'
delete  from tbl_returnorder where docid='RT10-00097'

select  *  from tbl_returnorderdetail where docid='RT10-00097'

update tbl_returnorderdetail set rpt=0,doz=0 where rpt is null and doz is null

update tbl_returnorder set CustPO='-' where CustPO is null
select CustPO from Master_SC01 where SCNO='BS-001320-09'

-- ProductionPlan
 
select * from master_dyemachine  d  left join master_productionplan p  on d.mcno = p.mcno

select * from Master_productionplan where seq=17

select master_dyemachine.*,colorr,colorg,colorb from master_dyemachine left join master_color_shade on master_dyemachine.MCShade = master_color_shade.shadeid where mcgroup = 'Dye' 

-- หา Seq ที่มากที่สุด
select max(Seq) as M   from master_productionplan where MCNo ='J-05'

-- SOP
SELECT     TSQuality, InternalQuality, ColorID, FunctionName, Detail, ProcessTime, LabCode, Remark, Approved
FROM         View_Master_SOP
WHERE   FunctionName='06. DYE'  and (TSQuality = 'if28017') AND (ColorID = '10A') AND (LabCode = 'TS-6970-E')
----------------------

select * from view_processday where plandate between  '2010-2-1'  and '2010-2-28'  order by plandate desc ,seq desc

select * from view_ordercard + master_productionplan + master_color

-- ตรงนี้ต้องเอา Plandate , Mcno , Seq มาหาค่าก่อน
select * from master_productionplan as p left join view_ordercard as v  on p.batchno = v.orderno and p.lotno = v.lotno
left join master_color as c on v.colorid= c.colorid left join master_sc01 as s on v.scno = s.scno  order by p.plandate  desc

select * from tbl_returnorder where docid='RT10-00003'
select * from view_detailreturn

select * from tbl_returnorder where docid='RT10-00008'

update tbl_returnorderdetail set inv=  'B52009140'   where docid='RT10-00015'

select * from packing_list_1 where scno like 'TS-069%'

update tbl_returnorderdetail set pcsno=0 where pcsno is null

select * from view_processday where  mcno in ('YPT-01')  and YEAR(plandate) = 2010 order by plandate,seq

select * from View_BatchCard  order by orderno desc
select *,dbo.CheckInformularFabric(Quality,ColorID,LabCode1) as checkformular,dbo.CalProcess(OrderNo, lotno) AS Process from view_batchcard  order by confirmdlvdate,colorid,quality,orderno,lotno

select * from view_batchchecklab order by BatchNo desc

select * from view_processday  where plandate between CAST('2010-2-1' AS SMALLDATETIME) and CAST('2010-2-28' AS SMALLDATETIME) and mcno='J-05' order by PLANDATE desc 

select dbo.CalDyeStatus('53/00388','1')

select * from master_color where colorname = 'TM WHITE'

select * from master_holiday

select * from master_color_shade

select * from master_plan_lock

--insert into tbl_colortext (colorname,colorr,colorg,colorb) (select * from master_color_shade)

-- สีที่เอาไว้แสดงผลของตัวหน้งสือ
select * from tbl_colortext
insert into tbl_colortext values('ARCTIC BLAST',255,255,255)

/***********************/

update tbl_colortext set colorr=255,colorg=255,colorb=255 where colorname='ORANGE'
select * from master_function

    Sqlstr = "SELECT FunctionName from View_Master_SOP where TSQuality = '" & FrmMainPlan.FGBatch.TextMatrix(zRow, 12) & "'" & _
            " and ColorID = '" & Replace(FrmMainPlan.FGBatch.TextMatrix(zRow, 14), "'", "''") & "' and LabCode = '" & FrmMainPlan.FGBatch.TextMatrix(zRow, 19) & "'" & _
            " and FunctionName in ('03. RELAX','06. DYE','11. DYE - RC','16.2 DYE - RC')"


select * from master_ordercard_lot where orderno='00012-10' and lotno=1

update master_ordercard_lot set plandye='False' where orderno='00012-10' and lotno=1

select * from master_productionplan where useradd='tungman' 

select * from master_plan_01 where userAdd='tungman'

delete from master_productionplan where useradd='tungman' --and BatchNo='00012-10' and LotNo=3

delete from master_plan_01 where userAdd='tungman'

select * from View_Master_SOP where TSQuality = 'DF28171' and ColorID='095A' and LabCode='AD-2923 BK (A)'

select * from view_processday where YEAR(plandate) = 2010  between CAST('2010-2-1' AS SMALLDATETIME) and CAST('2010-2-4' AS SMALLDATETIME) AND USERADD='tungman'


select * from view_processday where  MCNO='YPT-15' and  plandate between CAST('2010-2-1' AS SMALLDATETIME) and CAST('2010-2-28' AS SMALLDATETIME)  

  UPDATE    master_productionplan
                           SET              plandate = CAST('2010-2-9' AS SMALLDATETIME)
                           WHERE     batchno = '00025-10' AND LotNo = 1 AND FC = '06. DYE'

select View_PlanProduction.*,colorname,ColorR,ColorG,ColorB,MCType,dbo.CalProcess(View_PlanProduction.batchno,View_PlanProduction.lotno) as  lastfc  from View_PlanProduction left join Master_Color ON  View_PlanProduction.ColorID = Master_Color.ColorID left join Master_DyeMachine ON View_PlanProduction.MCNo = Master_DyeMachine.MCNo where Master_DyeMachine.MCNo in ('DYE-SALE')
and plandate BETWEEN CAST('2010-2-1' AS SMALLDATETIME) AND CAST('2010-2-20' AS SMALLDATETIME)


select * from Packing_List_1  -- TSQuality

select * from master_sc01  -- TSQuality

select * from  master_color

select * from view_detailreturn

use IT-03

select * from tbl_returnorder where docid='RT10-00020'

update tbl_returnorderdetail set inv = 'B53001109' where DOCID='RT10-00020'

select * from master_sc01 where SCNO ='BS-001318-09'


SELECT   View_PlanProduction.*,Master_DyeMachine.mctype, Master_OrderCard_Print.PrintDate AS PrintDate,dbo.ChkIssueGreige(View_PlanProduction.BatchNo,View_PlanProduction.lotno,View_PlanProduction.RefOrd) as IssueGreige  FROM View_PlanProduction left join Master_DyeMachine ON View_PlanProduction.MCNo = Master_DyeMachine.MCNo LEFT JOIN Master_OrderCard_Print ON View_PlanProduction.LOTNO = Master_OrderCard_Print.LotNo  AND View_PlanProduction.batchNo = Master_OrderCard_Print.BatchNo where View_PlanProduction.fcno =1 and View_PlanProduction.plandate = CAST('2010-1-6' as SMALLDATETIME) and Master_DyeMachine.mctype='TS-S'

select * from Packing_List_1 where invoiceno='B53000451'


select d.*,dbo.CheckInformularFabric(d.Quality, d.ColorID, d.LabCode1) as checkformular,dbo.CalProcess(d.OrderNo, d.LOTNO) as [process] from View_BatchCard as d



with CTE(
	     orderno,
	     lotno,
	     paperprint,
	     dyelotApp,
	     knit_finished,
	     Chemical_Finished,
	     checkformular,
	     ChemiProblem,
	     IssueGreige 
) AS (
select 
orderno,lotno,
paperprint,
dbo.CheckSubmittype(Quality, ColorID,LabCode1,brand,seasoncode,seasonyear) AS dyelotApp,
knit_finished,
Chemical_Finished,
dbo.CheckInformularFabric(Quality, ColorID,LabCode1) as checkformular,
 dbo.ChkChemiProblem(Quality, ColorID,LabCode1) as ChemiProblem,
dbo.ChkIssueGreige(orderno,lotno,RefOrd) as IssueGreige 

 from View_OrderCardDetail   ) select * from CTE

select orderno,lotno,paperprint,dbo.CheckSubmittype(Quality, ColorID,LabCode1,brand,seasoncode,seasonyear) AS dyelotApp,knit_finished,Chemical_Finished,dbo.CheckInformularFabric(Quality, ColorID,LabCode1) as checkformular, dbo.ChkChemiProblem(Quality, ColorID,LabCode1) as ChemiProblem,dbo.ChkIssueGreige(orderno,lotno,RefOrd) as IssueGreige from View_OrderCardDetail  where orderno 
between '00033-03' and '00035-04'
--between '53/00001' and '53/00010' ok


 select BatchNo from Master_OrderCard_Print where  BatchNo='52/12970' and LotNo=1
--select * from master_SC02 
--
--
--select * from master_SC02  where SCNO LIKE 'BS-001319-09%' and ColorID='ALASKAN BLUE#OW19'
--
--select * from Packing_List_2

select top(10) * from Master_Process_1

select * from tbl_returnorder as r cross apply (select * from tbl_returnorderdetail) as rd

select * from tbl_returnorder as r left  join tbl_returnorderdetail as rd on r.docid = rd.docid

select brandname from master_brand


SELECT  
View_PlanProductionBrand.Plandate, 
View_PlanProductionBrand.Brand, 
Master_DyeMachine.MCType,
COUNT(View_PlanProductionBrand.MCNo) AS queue, 
SUM(View_PlanProductionBrand.batch) AS sumbatch,
SUM(View_PlanProductionBrand.yds) AS sumyds, 
SUM(View_PlanProductionBrand.kgs) AS sumkgs,
 SUM(View_PlanProductionBrand.pcs) AS sumpcs 
FROM View_PlanProductionBrand left join Master_DyeMachine ON View_PlanProductionBrand.MCNo = Master_DyeMachine.MCNo 
WHERE View_PlanProductionBrand.Plandate 
between CAST('2010-2-1' as smalldatetime) and CAST('2010-2-10' AS SMALLDATETIME)
GROUP BY View_PlanProductionBrand.Plandate,
View_PlanProductionBrand.Brand,
 Master_DyeMachine.MCType 
order by View_PlanProductionBrand.Plandate,
View_PlanProductionBrand.Brand

select  * from master_dyemachine

select view_planproduction.mcno,view_planproduction.seq,fc,reford,view_planproduction.sop,Capacity,lot_pcs,lot_kgs,yds,PackStatus from view_planproduction 
left join Master_DyeMachine ON View_PlanProduction.MCNo = Master_DyeMachine.MCNo  
where plandate = CAST('2010-2-2' AS SMALLDATETIME) and MCType = '600 Kg.'
and MCType in('150 Kg','300 Kg.','600 Kg.','TS-S') order by view_planproduction.mcno,seq



--select datename(dd,getdate())

--SELECT @@VERSION AS 'SQL Server Version'

SELECT @@DATEFIRST AS '1st Day'  -- คืนค่าออกมาเป็นวันที่ของวันอาทิตย์ในสัปดาห์

SELECT DATEPART(hh, GETDATE());

select @@servername


SELECT 
Brand, 
CustID, 
COUNT(BatchNo) AS batch, 
SUM(LOT_PCS) AS pcs, 
SUM(LOT_KGS) AS kgs,
SUM(Yds) AS Yds From View_PlanProduction left join Master_DyeMachine 
ON View_PlanProduction.MCNo = Master_DyeMachine.MCNo
Where FCNo = 1 and plandate = CAST('2010-2-1' as smalldatetime)
and MCType IN ('150 kg','600 kg.')
GROUP BY Brand, CustID order by Brand, CustID

/*** Yarn **********/
SELECT ys.*, yt.* FROM YARN_transection  as yt
inner join Yarn_Stock as ys on   yt.Yarn_No  = ys.Yarn_No and yt.SupplierID = ys.SupplierID 



EXEC SP_EXECUTESQL sp_DistinctYarnCode
select *  from YARN_transection order by supplierID

SELECT * FROM Master_Supplier

select * from YARN_Stock order by SupplierID


/* ------------------ End Yarn -----------------*/






/* --------------------------- Remote Query ------------------------------------ */
select o.*,od.* from OPENDATASOURCE('SQLNCLI','DATA SOURCE=TS-DYESERVER;USER ID=sa;PASSWORD=dbadmin;')
.TSDB_MAIN.dbo.tbl_returnorder as o inner join tbl_returnorderdetail as od on o.docid = od.docid



select * from OPENDATASOURCE('SQLNCLI','DATA SOURCE=TS-DYESERVER;USER ID=sa;PASSWORD=dbadmin;')
.TSDB_MAIN.dbo.view_SOPLab


delete from  OPENDATASOURCE('SQLNCLI','DATA SOURCE=IT-03;USER ID=sa;PASSWORD=dbadmin;').OLE.dbo.tbl_mc where MCId is null

SELECT MC.*,v.mcno as M
FROM OPENROWSET(N'SQLNCLI',
 N'data source=TS-DYESERVER;Trusted_Connection=yes;USER ID=sa;PASSWORD=dbadmin',
     N'SELECT * from TSDB_MAIN.dbo.Master_DyeMachine') 
AS MC inner join view_planproduction as v on MC.MCNo = v.MCNO

-- ตรง admin จะขาดไม่ได้
SELECT uid,pwd,usertype
   FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
      'C:\Test.mdb';
      'admin';'',tbl_user)
GO
/* --------------------------- Remote Query ------------------------------------ */

 -- *************************** วิธีการใช้ OUTPUT *************************
/* 
ถ้าเป็น Insert ต้องใช้เป็น Inserted
*/
insert into tbl_user 
OUTPUT inserted.uid,
inserted.pwd,
inserted.usertype

values('tungman','01553',1)




/* 
SET QUOTED_IDENTIFIER { ON | OFF }  ทำให้ใส่ " ได้ถ้าเป็น OFF
SET QUOTED_IDENTIFIER OFF
select * from tbl_user where uid="tungman"
*/
set dateformat  dmy;  /* mdy, dmy, ymd, ydm, myd, and dym*/

SET ANSI_NULLS { ON | OFF }
-- ถ้า ON แล้วจะใช้ = , <> กับค่า null ได้


LEFT OUTER JOIN or LEFT JOIN


RIGHT OUTER JOIN or RIGHT JOIN


FULL OUTER JOIN or FULL JOIN

SELECT OBJECT_NAME(OBJECT_ID(N'OLE.dbo.tbl_user') )
AS 'Object ID';

/* -------------------------------------- sp System -----------------------------------------*/
/* หาขนาดของ TABLE */
sp_spaceused 'master_SC01'

/*  show all database name */
sp_helpdb N'TSDB_MAIN'

EXEC sp_renamedb N'OLE', N'OLE2';
GO
SELECT name, database_id, modified_date
FROM sys.databases
WHERE name = N'OLE2';
GO

--sp_dropserver

-- หา sql statement in view 
-- ตรง columnname จะเอาไว้หา compute column

exec sp_helptext @objname='view_order',@columnname = ''
EXEC sp_helptext  sp_GetProductname

-- หาโครงสร้างของ Table ที่ระบุ
exec sp_help products
/*  -------------------------------------- End sp System ------------------------------------ */

DECLARE @SQLString NVARCHAR(500);
SET @SQLString = N'SELECT FirstName, LastName, JobTitle' + CHAR(13);
SET @SQLString = @SQLString + N'FROM HumanResources.vEmployee' + CHAR(13);
SET @SQLString = @SQLString + N'WHERE LastName LIKE ''D%''';

exec sp_executesql @SQLString


-- ดึงค่า   servername and Linked server
EXEC sp_helpserver 'IT-03'

exec sys.databases 'IT-03'

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'OLE Administrator',
    @recipients = 'tungman_it19@hotmail.com',
    @query = 'select * from tbl_user' ,
    @subject = 'Work Order Count',
    @attach_query_result_as_file = 1 ;

DECLARE @tableHTML  NVARCHAR(MAX) ;

SET @tableHTML =
    N'<H1>Work Order Report</H1>' +
    N'<table border="1">' +
    N'<tr><th>Work Order ID</th><th>Product ID</th>' +
    N'<th>Name</th><th>Order Qty</th><th>Due Date</th>' +
    N'<th>Expected Revenue</th></tr>' +
    CAST ( ( SELECT td = wo.WorkOrderID,       '',
                    td = p.ProductID, '',
                    td = p.Name, '',
                    td = wo.OrderQty, '',
                    td = wo.DueDate, '',
                    td = (p.ListPrice - p.StandardCost) * wo.OrderQty
              FROM AdventureWorks.Production.WorkOrder as wo
              JOIN AdventureWorks.Production.Product AS p
              ON wo.ProductID = p.ProductID
              WHERE DueDate > '2004-04-30'
                AND DATEDIFF(dd, '2004-04-30', DueDate) < 2 
              ORDER BY DueDate ASC,
                       (p.ListPrice - p.StandardCost) * wo.OrderQty DESC
              FOR XML PATH('tr'), TYPE 
    ) AS NVARCHAR(MAX) ) +
    N'</table>' ;

EXEC msdb.dbo.sp_send_dbmail @recipients='danw@Adventure-Works.com',
    @subject = 'Work Order List',



/* ---------------------------------- END sp System ---------------------------- */

/* ---------------------------------- sys ------------------------------------------ */
SELECT [name],database_id,owner_sid,create_date,state_desc DatabaseStatus_sysDatabase,state
FROM sys.databases

SELECT *
FROM sys.databases
 

-- select all table name
select * from sys.tables


USE AdventureWorks;
GO
--Creates an infinite loop
WITH cte (EmployeeID, ManagerID, Title) as
(
    SELECT EmployeeID, ManagerID, Title
    FROM HumanResources.Employee
    WHERE ManagerID IS NOT NULL
  UNION ALL
    SELECT cte.EmployeeID, cte.ManagerID, cte.Title
    FROM cte 
    JOIN  HumanResources.Employee AS e 
        ON cte.ManagerID = e.EmployeeID
)
--Uses MAXRECURSION to limit the recursive levels to 2
SELECT EmployeeID, ManagerID, Title
FROM cte
OPTION (MAXRECURSION 1);
GO


/* ----------------------- HINTS --------------------------*/

set NOCOUNT ON
select * from view_order 
 OPTION (FAST 100)

DECLARE @c int
set @c = ( select COUNT(*) FROM tbl_user)
select @c
select * from tbl_user as u1
union
select * from tbl_user3 as u2)
OPTION (MERGE UNION)

-- MERGE JOIN

-- ห้ามใช้ distinct ร่วมกับ CUBE , ROLLUP
select MAX(distinct usertype) from tbl_user

SELECT TOP(2) WITH TIES * from tbl_user order by uid


DECLARE @sql nvarchar(4000),@u nvarchar(10)

-- ถ้าเป็นตัวแปร string ต้องใช้ ''' 
set @u = N'tum'

SET @sql = N'SELECT * FROM tbl_user '

IF @u <> ''
     BEGIN
	set @sql = @sql + ' WHERE uid = ''' + @u  + ''' OPTION (FAST 10)'
     END
ELSE
     BEGIN
	SET @sql = @sql + ' OPTION (FAST 10) '
     END 
     
PRINT  @sql

EXEC sp_executesql @sql

UPDATE tbl_user set usertype=4 where uid='sa'

ALTER TRIGGER [dbo].[LogUpdate]

on [dbo].[tbl_user] AFTER UPDATE AS

insert into tbl_logupdate values(getdate(),'tbl_user')

-- ใช้สำหรับดัก TRIGGER
IF ( UPDATE (usertype))
     BEGIN
	     insert into tbl_logupdate values(getdate(),'tbl_user')
END

/* ----------------------------- Function ------------------------------ */

 -- สามารถใส่ ' ,",[ ] ได้
select  quotename(uid,'''') as uid from tbl_user 

-- กลับตัวอักษร
select REVERSE(N'TUNGMAN') as R

-- หาจำนวนเต็ม
select ROUND(2.75,3) as Col

-- ตัดช่องว่างด้านหลังออก 
select RTRIM(uid) as a ,* from tbl_user 

-- ตัดช่องว่างด้านหน้าออก
select LTRIM(uid) as u from tbl_user

--ใส่ช่องว่างของข้อความ
select fname + SPACE(1) + lname as F from tbl_user

select RTRIM(uid) + SPACE(2) + LTRIM(pwd) as [User] from tbl_user



/* -------------------------------- ข้อควรจำ --------------------------------------*/
NVARCHAR(MAX)

RETURN -- เอาไว้ใน Store หมายความว่าให้ออกจาก Store same Exit Sub of VB.NET

DECLARE c cursor For
SElect * from tbl_user

OPEN c

FETCH NEXT from c
WHILE @@FETCH_STATUS =0
BEGIN
FETCH NEXT FROM c
END 
CLOSE c
DEALLOCATE c
--------------------------------------------------
SET ROWCOUNT 5 -- เหมือน TOP 
GO
SET dateformat  dmy
GO
DECLARE @d NVARCHAR(20),@d2 NVARCHAR(20)

set @d= CONVERT(SMALLDATETIME,'1996/7/4',102) 
set @d2 = CONVERT(SMALLDATETIME,'1996/9/4',102) 
declare @sql nvarchar(max)

set @sql = N'select * from Orders where Orderdate between ''' + @d + ''' and ''' + @d2  + ''''

SELECT @SQL
exec (@sql)


/* เวาลาเรียกใช้ Store แบบมี parameter ให้ใช้แบบนี้ 
exec sp_GetProductname @p='120'
*/

-- all คือการเอาค่าออกมาทั้งหมดจากค่าที่อยู่ใน in คือ สามารถใช้ < > = <> ได้เลย 1,2,3 
select * from products where productid  > all (select productid from products where productid in(1,2,3))

select * from products where productid  < all (select productid from products where productid in(75,76,77))

exec sp_testlinkedserver OLE

USE AdventureWorks;
GO
SELECT City, PostalCode
FROM Person.Address 
WHERE ISNUMERIC(PostalCode)<> 1;
GO

-- การใช้ default value ต้องใช้แบบนี้ N'12345'
insert into tbl_user values('cccc','rrrrr','dddd',2)


update tbl_user set  usertype=
case when usertype = 1 then usertype * 2
 when usertype = 2 then usertype * 3
 when usertype = 3 then usertype * 4
when usertype = 4 then usertype * 5
end


USE AdventureWorks ;
GO
SELECT TOP(10) PERCENT WITH TIES
EmployeeID, Title, DepartmentID, Gender
FROM HumanResources.Employee
ORDER BY EmployeeID DESC;


SELECT CASE WHEN (GROUPING(Item) = 1) THEN 'ALL'
            ELSE ISNULL(Item, 'UNKNOWN')
       END AS Item,
       SUM(Quantity) AS QtySum
FROM Inventory
GROUP BY Item WITH CUBE
GO


select t.* from OPENROWSET('SQLNCLI','data source=IT-03;uid=sa;pwd=dbadmin;','select * from TSDB_MAIN.dbo.tbl_returnorder;') as t

