CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_n_products_per_division_by_sold_qty`(
	in fiscal_year year,
    in top_n int
)
BEGIN
	# get top n Products in each division by their quantity sold
with cte1 as (
	select 
		s.fiscal_year,
        p.division,
        p.product,
        sum(s.sold_quantity) as total_qty
    from gdb041.fact_sales_monthly s
    join gdb041.dim_product p
    on s.product_code = p.product_code
    where s.fiscal_year = fiscal_year
    group by p.product
),
cte2 as (
select
	*,
    dense_rank() over(partition by division order by total_qty desc) as drnk
from cte1
)

select * from cte2 where drnk <= top_n;

END