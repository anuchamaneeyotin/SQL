SELECT ys.*, yt.*,s.SupplierName FROM YARN_transection  as yt
 inner join Yarn_Stock as ys on   yt.Yarn_No  = ys.Yarn_No and yt.SupplierID = ys.SupplierID 
 inner join Master_Supplier as s on yt.supplierID = s.SupplierID


EXEC SP_EXECUTESQL sp_DistinctYarnCode
select *  from YARN_transection order by supplierID

SELECT * FROM Master_Supplier

select * from YARN_Stock order by SupplierID