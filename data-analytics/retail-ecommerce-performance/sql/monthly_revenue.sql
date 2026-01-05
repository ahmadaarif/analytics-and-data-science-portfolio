select strftime(
   '%Y-%m',
   invoicedate
) as month,
       round(
          sum(revenue),
          2
       ) as monthly_revenue
  from retail_sales
 group by month
 order by month;