with cte1 as (
select
	c.customer,
    m.region,
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales s
join dim_customer c
	on s.customer_code = c.customer_code 
join dim_market m
	on s.market = m.market
where s.fiscal_year = 2021
group by c.customer, m.region
)

select 
		*,
		net_sales_mln*100/sum(net_sales_mln) over(partition by region) as pct
from cte1
order by region, net_sales_mln desc