select 
	g.fiscal_year,
	round(sum(sold_quantity*gross_price),2) as gross_price_total
from gdb041.fact_sales_monthly s
join gdb056.gross_price as g
on s.product_code = g.product_code and get_fiscal_year(s.date) = g.fiscal_year
where customer_code = (select customer_code from gdb041.dim_customer where customer like '%Croma%')
group by g.fiscal_year
order by g.fiscal_year asc;