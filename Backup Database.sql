RESTORE HEADERONLY FROM DISK ='D:\Backupdatabase\STMMDB_TEST.bak'

RESTORE VERIFYONLY FROM DISK ='D:\Backupdatabase\STMMDB_TEST.bak'


BACKUP DATABASE STMMDB_TEST TO  DISK ='D:\Backupdatabase\STMMDB_TEST.bak' with FORMAT, INIT ,CHECKSUM ,MEDIANAME='stmmdb_TEST' ,MEDIADESCRIPTION='FULL Backup Database STMMDB_TEST FROM Tungman', NAME='stmmdb_TEST',COMPRESSION,DESCRIPTION='FULL Backup Database STMMDB_TEST FROM Tungman'