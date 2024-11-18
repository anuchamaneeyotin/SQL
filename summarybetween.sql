declare @docid nvarchar(max)


DECLARE @sql nvarchar(max),@startdoc nvarchar(50),@enddoc nvarchar(50)


set @startdoc='''RT10-00010'''
SET @enddoc='''RT10-00019'''


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
having r.docid between ' + @startdoc + ' and ' + @enddoc + ' order by r.docid'

exec (@sql)