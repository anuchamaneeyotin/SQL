

select  OBJECT_NAME(parent_ID) as Tablename,*
from sys.triggers
where is_disabled = 1 ;


ENABLE TRIGGER U_CO_TEST ON dbo.CO;

DISABLE TRIGGER U_CO_TEST ON dbo.CO



SELECT OBJECT_NAME(1034903204)