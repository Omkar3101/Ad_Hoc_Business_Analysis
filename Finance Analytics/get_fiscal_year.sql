CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_year`(
	calender_year datetime
) RETURNS int
    DETERMINISTIC
BEGIN
	declare fiscal_year numeric;
    set fiscal_year = Year(date_add(calender_year, interval 4 month));
RETURN fiscal_year;
END