SELECT     dbo.Master_FinishGood_TS1.Barcode, dbo.Master_FinishGood_TS1.Shelf, dbo.Master_FinishGood_TS1.In_Date, 
                      dbo.Master_FinishGood_TS1.Out_Date, dbo.Master_FinishGood_TS1.Status, dbo.Master_FinishGood_TS1.Warehouse, 
                      dbo.Master_FinishGood_TS1.Out_Flag, dbo.Master_FinishGood_TS1.In_Flag, dbo.Master_FinishGood_TS1.OutNo, dbo.Packing_Item.PackNo, 
                      dbo.Packing_Item.PieceNo, dbo.Packing_Item.Kgs, dbo.Packing_Item.Yds, dbo.Packing_Item.Mtr, dbo.Packing_Item.Rpt, dbo.Packing_Item.Grade, 
                      dbo.Packing.BatchNo, dbo.Packing.LotNo, dbo.Master_OrderCard_Lot.SCNO, dbo.Master_OrderCard.Quality, dbo.Master_OrderCard.LabCode1, 
                      dbo.Master_OrderCard.Color1, dbo.Master_WH.WHType, dbo.Packing_Item.Remark, dbo.Master_FinishGood_TS1.Price, 
                      dbo.Master_OrderCard_Lot.ITEM, dbo.Packing.PackDate, dbo.Master_OrderCard.Width1, dbo.Master_FinishGood_TS1.Booking, 
                      dbo.Master_FinishGood_TS1.BookingRemark, dbo.Master_FinishGood_TS1.UserBook, dbo.Master_FinishGood_TS1.BookDate, 
                      dbo.Master_OrderCard.ColorId, dbo.Master_FinishGood_TS1.LifeDate, dbo.CalFGGW(dbo.Master_OrderCard_Lot.SCNO, dbo.Packing.Core, 
                      dbo.Master_OrderCard.Width1, dbo.Packing_Item.Kgs) AS GW, dbo.Packing_Item.RptB, dbo.Packing_Item.Rpt_All, dbo.Packing_Item.RptH
FROM         dbo.Master_FinishGood_TS1 WITH (INDEX=0)
LEFT OUTER JOIN
                      dbo.Packing_Item WITH(INDEX(IX_PACKING_ITEM_1))  ON dbo.Master_FinishGood_TS1.Barcode = dbo.Packing_Item.Barcode LEFT OUTER JOIN
                      dbo.Packing  ON dbo.Packing_Item.PackNo = dbo.Packing.PackNo LEFT OUTER JOIN
                      dbo.Master_OrderCard_Lot   ON dbo.Packing.BatchNo = dbo.Master_OrderCard_Lot.OrderNo AND 
                      dbo.Packing.LotNo = dbo.Master_OrderCard_Lot.LOTNO LEFT OUTER JOIN
                      dbo.Master_OrderCard  ON dbo.Master_OrderCard_Lot.OrderNo = dbo.Master_OrderCard.OrderNo LEFT OUTER JOIN
                      dbo.Master_WH ON dbo.Master_FinishGood_TS1.Warehouse  = dbo.Master_WH.WHID 
WHERE OUT_DATE BETWEEN '2010-6-1' and '2010-6-1'