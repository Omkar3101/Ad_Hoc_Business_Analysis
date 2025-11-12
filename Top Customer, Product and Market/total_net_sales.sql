CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `s`.`date` AS `date`,
        `s`.`fiscal_year` AS `fiscal_year`,
        `s`.`product_code` AS `product_code`,
        `s`.`customer_code` AS `customer_code`,
        `s`.`market` AS `market`,
        `s`.`customer_name` AS `customer`,
        `s`.`product` AS `product`,
        ROUND((((`g`.`gross_price` * `s`.`sold_quantity`) - `pre`.`pre_invoice_discounts`) - `post`.`post_invoice_discounts`),
                2) AS `net_sales`
    FROM
        (((`fact_sales_monthly` `s`
        JOIN `gdb056`.`gross_price` `g` ON (((`s`.`product_code` = `g`.`product_code`)
            AND (`s`.`fiscal_year` = `g`.`fiscal_year`))))
        JOIN `pre_invoice_discounts` `pre` ON (((`s`.`product_code` = `pre`.`product_code`)
            AND (`s`.`customer_code` = `pre`.`customer_code`)
            AND (`s`.`date` = `pre`.`date`))))
        JOIN `post_invoice_discounts` `post` ON (((`s`.`product_code` = `post`.`product_code`)
            AND (`s`.`customer_code` = `post`.`customer_code`)
            AND (`s`.`date` = `post`.`date`))))