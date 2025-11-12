CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `post_invoice_discounts` AS
    SELECT 
        `p`.`date` AS `date`,
        `p`.`customer_code` AS `customer_code`,
        `p`.`product_code` AS `product_code`,
        ROUND(((`p`.`discounts_pct` * (`g`.`gross_price` * `s`.`sold_quantity`)) + (`p`.`other_deductions_pct` * (`g`.`gross_price` * `s`.`sold_quantity`))),
                2) AS `post_invoice_discounts`
    FROM
        ((`fact_sales_monthly` `s`
        JOIN `gdb056`.`post_invoice_deductions` `p` ON (((`s`.`customer_code` = `p`.`customer_code`)
            AND (`s`.`product_code` = `p`.`product_code`)
            AND (`s`.`date` = `p`.`date`))))
        JOIN `gdb056`.`gross_price` `g` ON (((`s`.`product_code` = `g`.`product_code`)
            AND (`s`.`fiscal_year` = `g`.`fiscal_year`))))