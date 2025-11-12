CREATE DEFINER=`root`@`localhost` PROCEDURE `get_forecast_accuracy`(
	in fiscal_year int
)
BEGIN
	with cte1 as (
select 
	s.fiscal_year as fiscal_year,
	f.customer_code,
    sum(s.sold_quantity) as sold_quantity,
    sum(f.forecast_quantity) as forecast_quantity,
	sum(f.forecast_quantity - s.sold_quantity) as net_err,
    sum(abs(f.forecast_quantity - s.sold_quantity)) as abs_err,
    round(sum(f.forecast_quantity - s.sold_quantity) * 100 / sum(f.forecast_quantity),2) as net_err_pct,
    round(sum(abs(f.forecast_quantity - s.sold_quantity)) * 100 / sum(f.forecast_quantity),2) as abs_err_pct 
from gdb041.fact_act_est f
join gdb041.fact_sales_monthly s
on f.date = s.date and f.sold_quantity = s.sold_quantity
where fiscal_year = fiscal_year
group by customer_code
)

select *,
	customer,
    market,
	if(abs_err_pct > 100, 0, 100 - abs_err_pct) as forecast_accuracy
from cte1
join gdb041.dim_customer
using (customer_code);
END