/*
Relation Link
Master_FinishGood_TS1 = Barcode
Packing_item = Barcode
Packing = PackNo link Packing_Item.PackNo

Master_OrderCard_Lot = OrderNo Link Packing.BatchNo and Packing.LotNo = Master_OrderCard_Lot.LotNo
*/

select Count(mf.Barcode) as Pcs,SUM(YDS) as YDS
from Master_FinishGood_TS1 as mf
left join Packing_item as pt ON mf.Barcode = pt.BarCode
LEFT JOIN Packing as p ON pt.PackNo = p.PackNo
LEFT JOIN Master_OrderCard_Lot AS OL on  p.BatchNo = OL.OrderNo and p.LotNo = ol.LotNo
LEFT JOIN Master_OrderCard AS OC on ol.OrderNo  = oc.OrderNo
where mf.status=0 and pt.Grade='A'
and oc.Quality = 'P15121-60' 
and oc.ColorId='A2RR'
and oc.LabCode1='ARB-00083 EB (C)' 


exec sp_SumBarCode 'P15121-60','A2RR','ARB-00083 EB (C)'

select count(barcode) as Pcs,sum(yds) as Yds from finishgood_view_detail

 where quality = 'P15121-60' and colorid = 'A2RR'

 and labcode1 = 'ARB-00083 EB (C)' and grade = 'A' and status = '0'

exec sp_help Master_FinishGood_TS1

exec  sp_help Packing

exec sp_help Packing_Item

exec sp_help Master_OrderCard

exec sp_help Master_OrderCard_Lot

select * from Master_OrderCard  where Quality = 'ADF28171'

-- ºÈ“ RF18035 
--  ’ A2Q9  NOBLE INK
-- labcode AD-02555 NI (A)


exec sp_GSDetail 2010,1,'CD50100-60 AM'