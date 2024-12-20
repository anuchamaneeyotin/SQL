--SELECT a.*,b.AttributeName  FROM Master_ItemAttribute_Value a LEFT JOIN Master_ItemAttribute b on a.AttributeID = b.AttributeID   WHERE ValueID =1302045


--SELECT * FROM vw_Item where categoryname='Surface Imos' and GroupRunning = 1 


--SELECT * FROM vw_Item where categoryname='Surface Imos' and GroupRunning = 1 

WITH X(materialID,Row,Valuename) as 
(
	select MaterialID,ROW_NUMBER() over(PARTITION by MaterialID order by MaterialID) as Row,ValueName from vw_Item
)
SELECT DISTINCT
a.MaterialID,
a.CategoryName ,
b.RunningNumber ,
t1.Valuename as V1,
t2.Valuename as V2,
t3.Valuename AS V3,
t4.Valuename as V4,
t5.Valuename as V5,
t6.Valuename as V6,
t7.Valuename as V7,
t8.Valuename as V8,
t9.Valuename as V9,
t10.Valuename as V10
from vw_Item a
LEFT JOIN Master_ItemRunningNumber b on a.MaterialID = b.MaterialID 
LEFT JOIN X as t1 on a.MaterialID = t1.materialID and t1.Row =1
LEFT JOIN X as t2 on a.MaterialID = t2.materialID and t2.Row =2
LEFT JOIN X as t3 on a.MaterialID = t3.materialID and t3.Row =3
LEFT JOIN X as t4 on a.MaterialID = t4.materialID and t4.Row =4
LEFT JOIN X as t5 on a.MaterialID = t5.materialID and t5.Row =5
LEFT JOIN X as t6 on a.MaterialID = t6.materialID and t6.Row =6
LEFT JOIN X as t7 on a.MaterialID = t7.materialID and t7.Row =7
LEFT JOIN X as t8 on a.MaterialID = t8.materialID and t8.Row =8
LEFT JOIN X as t9 on a.MaterialID = t9.materialID and t9.Row =9
LEFT JOIN X as t10 on a.MaterialID = t10.materialID and t10.Row =10
--where categoryname='Surface Imos' 