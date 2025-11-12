CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
	calender_year datetime
) RETURNS char(2) CHARSET latin1
    DETERMINISTIC
BEGIN
	declare Quarters char(2);
    case 
    when month(calender_year) in (9,10,11) then set Quarters = 'Q1';
    when month(calender_year) in (12,1,2) then set Quarters = 'Q2';
    when month(calender_year) in (3,4,5) then set Quarters = 'Q3';
    else set Quarters = 'Q4';
    end case;
RETURN Quarters;
END