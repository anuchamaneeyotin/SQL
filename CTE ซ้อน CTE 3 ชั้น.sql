
with CTE(schoolid,schoolname,provincename)
as
(
	select schoolid,schoolname,provincename from tbl_school
),a as 
(
	select * from CTE where schoolname is not null
),b as
(
	select * from a
)
select * from b