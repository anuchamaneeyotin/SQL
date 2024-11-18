restore database stmmdb_TEST
from disk = 'D:\BackupDatabase\stmmdb_TEST.bak'
WITH MOVE 'stmmdb' TO 'D:\Database\stmmdb.mdf',
MOVE 'stmmdb_2' TO 'D:\Database\stmmdb_TEST_1.ndf',
 MOVE 'stmmdb_4' TO 'D:\Database\stmmdb_TEST_2.ndf',
MOVE 'stmmdb_log' TO 'D:\Database\stmmdb_log1.ldf',
MOVE 'stmmdb_2_log' TO 'D:\Database\stmmdb_2_log.ldf',
MOVE 'stmmdb_3_log' TO 'D:\Database\stmmdb_3_log.ldf',

--RECOVERY
REPLACE