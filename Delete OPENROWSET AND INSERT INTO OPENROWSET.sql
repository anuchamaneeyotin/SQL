

DELETE  OPENROWSET('Microsoft.ACE.OLEDB.12.0','\\192.168.1.6\imos AG\StarmarkPrice.mdb';'Admin';'',CabinetBasePrice)


INSERT INTO OPENROWSET('Microsoft.ACE.OLEDB.12.0','\\192.168.1.6\imos AG\StarmarkPrice.mdb';'Admin';'','
SELECT Code,W,D,H,CarcassBasePrice,DoorBasePrice from CabinetBasePrice')
SELECT distinct
		A.Codes,
		Width = ISNULL(b.width *10,0),
		Depth = ISNULL(b.Depth * 10,0),
		Height = ISNULL(b.Height * 10,0),
		isnull(B.CarcaseBasePrice,0) as CarcaseBasePrice,
		isnull(B.FrontBasePrice,0) as DoorBasePrice
FROM MO.Modular A
LEFT JOIN MO.Modular01 B ON A.ID = B.ParentID

