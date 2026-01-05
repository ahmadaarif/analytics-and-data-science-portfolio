select country,
       round(
          sum(revenue),
          2
       ) as country_revenue
  from retail_sales
 group by country
 order by country_revenue desc;