exec sp_getgs 'Circular Knit' with recompile

exec sp_recompile 'finishgood_view_detail';

select * from finishgood_view_detail 
where in_date <= '2010-8-1' and out_date >= '2010-8-30'
and WHType ='Export'
OPTION(KEEPFIXED PLAN )

exec sp_recompile 'dbo.Packing_Summary'

select * from Packing_Summary where barcode between '0177922' and '0572326'