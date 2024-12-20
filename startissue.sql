set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go









-- =============================================
-- Author:		tungman
-- Create date:	4/3/53
-- Description:	Start Issue MasterPlan
-- =============================================
ALTER PROC [dbo].[sp_StartIssue]
	-- Add the parameters for the stored procedure here
	     @p nvarchar(max),
	     @mc nvarchar(max)
	
AS
	     DECLARE @sql nvarchar(max)


	set @sql = N'SELECT View_PlanProduction.*
,Master_DyeMachine.mctype,
 Master_OrderCard_Print.PrintDate AS PrintDate,
dbo.CalIssueGreige(View_PlanProduction.batchno,View_PlanProduction.lotno) as IssueFabric 
FROM View_PlanProduction left join Master_DyeMachine ON View_PlanProduction.MCNo = Master_DyeMachine.MCNo
 LEFT JOIN Master_OrderCard_Print ON View_PlanProduction.LOTNO = Master_OrderCard_Print.LotNo
 AND View_PlanProduction.batchNo = Master_OrderCard_Print.BatchNo where View_PlanProduction.fcno =1' 

IF @P <> ''
BEGIN
SET @sql = @sql + N' and   View_PlanProduction.plandate=' + CONVERT(nvarchar(max),@p,120) + ''
END
else
BEGIN
set @sql = @sql 
END
if @mc <> ''
BEGIN
set @sql = @sql +N' and Master_DyeMachine.mctype in(' + @mc + ')'
END
else
BEGIN
set @sql = @sql
END

SET @SQL = @sql + 'ORDER BY View_PlanProduction.BatchNo, View_PlanProduction.LOTNO'

EXEC sp_executesql @sql









