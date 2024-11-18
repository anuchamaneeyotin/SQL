
with CTE(USR,PWD,USERTYPE) as 
(
	select uid,pwd,
CASE 
usertype when  NULL then 'U' else usertype end as usertype from tbl_user
) select UPPER(USR) AS USR,PWD,USERTYPE from CTE