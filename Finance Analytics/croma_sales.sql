# Croma India Product Wise Sales Report for fiscal year 2021

select 
	date_format(s.date, '%b %y') as date,
    p.product,
    s.sold_quantity,
    Round(g.gross_price,2) as gross_price,
    Round((g.gross_price * s.sold_quantity),2) as total_gross_price
from gdb041.fact_sales_monthly s
join gdb041.dim_product p
on s.product_code = p.product_code 
join gdb056.gross_price g
on s.product_code = g.product_code
where customer_code = (
	select 
		customer_code
	from dim_customer
    where customer like '%Croma%'
)
and get_fiscal_year(s.date) = 2021
and get_fiscal_quarter(s.date) = "Q1"
order by s.date asc;


