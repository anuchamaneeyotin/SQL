
EXEC [sp_GetGS2] ''

ALTER table  Master_Process_1
add constraint pk  with FILLFACTOR=100  DEFAULT 50 FOR PROCESSNo
 


ALTER TABLE MASTER_PROCESS_1
DROP constraint DF_Master_Process1_UserName_1


alter table MASTER_PROCESS_1
add constraint PK   with fillfactor=100

ALTER TABLE MASTER_PROCESS_1
ADD CONSTRAINT CT_ProcessNo PRIMARY KEY(PROCESSNO) WITH FILLFACTOR=100


ALTER TABLE MASTER_PROCESS_1
DROP PRIMARY KEY ProcessNo

