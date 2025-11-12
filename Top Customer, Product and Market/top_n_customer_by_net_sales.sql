CREATE DEFINER=`root`@`localhost` PROCEDURE `top_n_customer_by_net_sales`(
	in fiscal_year year,
    in top_n int
)
BEGIN
	select 
		customer,
		round(sum(net_sales)/1000000,2) as net_sales_mln
	from gdb041.net_sales
	where fiscal_year = fiscal_year
	group by customer
	order by net_sales_mln desc
	limit top_n;
END