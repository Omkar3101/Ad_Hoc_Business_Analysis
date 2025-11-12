with cte1 as(
select
	customer,
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales s
where s.fiscal_year = 2021
group by customer
)

select 
		*,
		net_sales_mln*100/sum(net_sales_mln) over() as net_sales_pct
from cte1
order by net_sales_mln desc