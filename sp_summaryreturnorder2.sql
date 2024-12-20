set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go





-- =============================================
-- Author:		tungman
-- Create date:  2/3/2553
-- Description:	
-- =============================================
ALTER PROC [dbo].[sp_summaryreturnorder2]
	-- Add the parameters for the stored procedure here
@docid nvarchar(255)

AS
DECLARE @sql nvarchar(2000)


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

set @sql = N'select 
rd.inv,
r.docid,ddreceive,
r.kremid,
r.scno,
r.custpo,
r.TSQuality,
rd.ColorID,
sum(yds) as yds,
sum(rpt) as rpt,
rd.defectcode
 from tbl_returnorder  as r
inner join tbl_returnorderdetail as rd on r.docid  = rd.docid
group by 
rd.inv,
r.docid,ddreceive,
r.kremid,
r.scno,
r.custpo,
r.TSQuality,
rd.ColorID,
rd.defectcode
having r.docid in(' + @docid + ')'
	     
exec sp_executesql @sql






