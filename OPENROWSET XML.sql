SELECT CONVERT(XML, BulkColumn) AS BulkColumn 
FROM OPENROWSET(BULK 'D:\KDMax xml Editor\1401220001_tungman_194.xml', SINGLE_BLOB) AS x;