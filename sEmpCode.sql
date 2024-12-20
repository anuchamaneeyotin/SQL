
  SELECT DISTINCT  
                 (select Top 1 sEmpCode from CT_maintenanceManager  Where nGroup_id in 
				 ( Select nGroup_id from CT_maintenance  Where  HR11SDAT.ESCODE = sEmpCode ) ) as sEmpIndex,ESCODE+' '+ESNMEF+' '+ESNMEL as sName,HR11SDAT.*                      
				 FROM   HR11SDAT   
			 INNER JOIN  HR11DDAT ON HR11SDAT.COCODE = 
				 HR11DDAT.COCODE AND HR11SDAT.ESCODE = HR11DDAT.EDCODE   
				 WHERE   (HR11SDAT.COCODE = 'TTT') AND (HR11DDAT.EDACT = 'C')  And ESCODE not in (Select sEmpCode from CT_maintenance  Where nGroup_id in (select nGroup_id from CT_maintenanceManager Where sEmpCode = '00158')) ORder by ESCODE 


WITH X1 AS
(
	SELECT A.* FROM HR11SDAT A  WHERE   (A.COCODE = 'TTT') AND (A.EDACT = 'C')  
),
X2 AS 
(
	SELECT * FROM CT_maintenance Where nGroup_id in (select nGroup_id from CT_maintenanceManager Where sEmpCode = '00158')
),
X3 AS 
(
	select sEmpCode from CT_maintenanceManager
)
SELECT X3.sEmpCode FROM X3 