

create VIEW dbo.vw_TranCompact WITH SCHEMABINDING
as

SELECT  DOCNOTRAN,Plang, COUNT_BIG(*) as A FROM dbo.OrderCMRequestFAC where Plang <> '' GROUP BY DOCNOTRAN,Plang


CREATE UNIQUE CLUSTERED INDEX ICU_vw_TranCompact
   ON dbo.vw_TranCompact(DOCNOTRAN,Plang)
   
   
   CREATE VIEW dbo.vw_ModelOrderFlatpack WITH SCHEMABINDING
   
   as
   
SELECT  DOCSTMM,CABINETNA,COUNT_BIG(*) AS A FROM DBO.ITEMCO WHERE LEFT(DOCSTMM,3) = 'COM' GROUP BY DOCSTMM,CABINETNA


CREATE UNIQUE CLUSTERED INDEX ICU_vw_ModelOrderFlatpack
   ON dbo.vw_ModelOrderFlatpack(DOCSTMM,CABINETNA)