

WITH X as (
SELECT * FROM CO WHERE LEFT(DOCSTMM,3) IN ('DIY','COM')
)
SELECT * FROM X



-- ��ͧ����Ẻ����������� AS

WITH X AS (
SELECT DOCSTMM ,QTY = COUNT(PRODUCTID)  FROM ITEMCO WHERE LEFT(DOCSTMM,3) = 'DIY' GROUP BY DOCSTMM
)
SELECT * FROM X