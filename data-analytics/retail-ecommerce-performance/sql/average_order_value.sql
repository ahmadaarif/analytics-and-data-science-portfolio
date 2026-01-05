select round(
   sum(revenue) / count(distinct invoiceno),
   2
) as average_order_value
  from retail_sales;