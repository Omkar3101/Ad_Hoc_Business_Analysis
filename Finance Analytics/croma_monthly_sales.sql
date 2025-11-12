# Gross Monthly Total Sales Report for Croma
select 
	date_format(date, '%b %y') as date,
	round(sum(sold_quantity*gross_price),2) as gross_price_total
from gdb041.fact_sales_monthly s
join gdb056.gross_price as g
on s.product_code = g.product_code and get_fiscal_year(s.date) = g.fiscal_year
where customer_code = (select customer_code from gdb041.dim_customer where customer like '%Croma%')
group by s.date
order by s.date asc;
