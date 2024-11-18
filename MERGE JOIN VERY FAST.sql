--DECLARE @a varchar(3);
--set @a = 'a';

--select tsquality from master_sc01

set FORCEPLAN ON;
with cte(scno,scdate,TSQuality) as 
(

	select scno,scdate,TSQuality from master_sc01 where YEAR(scdate) = 2010

)
, A as 
(
	select CTE.* from cte 
inner MERGE  join master_sc02 as b on cte.scno = b.scno
inner  JOIN MASTER_FABRIC as c on cte.TSQuality = c.TOS_CODE
where SUBSTRING(cte.scno,0,3)= N'TS'
)
select * from A 
order by scno 
OPTION (FORCE ORDER)