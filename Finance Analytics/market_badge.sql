CREATE DEFINER=`root`@`localhost` PROCEDURE `market_badge`(
	In fy year,
    In mark text,
    out badge text
)
BEGIN
declare qty int default 0;

# default market
if mark = '' then 
	set mark = 'India';
end if;

select
    sum(sold_quantity) into qty
from gdb041.fact_sales_monthly
where market = mark and get_fiscal_year(date) = fy
group by market;

if qty > 5000000 then
	set badge = 'Gold';
else
	set badge = 'Silver';
end if;
END