
--select * from Master_SC01

SELECT TSQuality,SCNO,[PUMA],[ADIDAS],[NIKE] FROM
(select SCNO,Brand,CustID,TSQuality from Master_SC01) p
PIVOT
(
	     count(CustID)
FOR Brand IN 
( [PUMA],[ADIDAS],[NIKE] )
) as pvt
