
-- partition by คือฟิลด์ที่ต้องการจัดกลุ่มในการเรียง
select name,color,ROW_NUMBER() OVER (PARTITION BY COLOR ORDER BY PRODUCTID) as No
from production.product