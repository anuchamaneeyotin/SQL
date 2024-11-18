select ISNULL(MAX(CAST(PrdID as INT)),1) as PrdID from PrdData

IF EXISTS(select PrdID from PrdData where PrdID='0001')
print 'OK'

IF EXISTS(select PrdID from PrdData where PrdID='0001')  'OK'