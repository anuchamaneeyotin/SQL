
-- partition by ��Ϳ�Ŵ����ͧ��èѴ�����㹡�����§
select name,color,ROW_NUMBER() OVER (PARTITION BY COLOR ORDER BY PRODUCTID) as No
from production.product