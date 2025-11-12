CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `pre_invoice_discounts` AS
    SELECT 
        `s`.`date` AS `date`,
        `p`.`customer_code` AS `customer_code`,
        `s`.`product_code` AS `product_code`,
        ROUND(((`s`.`sold_quantity` * `g`.`gross_price`) * `p`.`pre_invoice_discount_pct`),
                2) AS `pre_invoice_discounts`
    FROM
        ((`fact_sales_monthly` `s`
        JOIN `gdb056`.`pre_invoice_deductions` `p` ON (((`s`.`customer_code` = `p`.`customer_code`)
            AND (`s`.`fiscal_year` = `p`.`fiscal_year`))))
        JOIN `gdb056`.`gross_price` `g` ON (((`s`.`product_code` = `g`.`product_code`)
            AND (`s`.`fiscal_year` = `g`.`fiscal_year`))))