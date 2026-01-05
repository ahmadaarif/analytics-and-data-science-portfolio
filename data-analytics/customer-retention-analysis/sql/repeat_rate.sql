with customer_orders as (
   select customerid,
          count(distinct invoiceno) as total_orders
     from retail_sales
    where customerid is not null
    group by customerid
),classified as (
   select case
             when total_orders > 1 then
                'Returning'
             else
                'One-time'
          end as customer_type
     from customer_orders
)
select customer_type,
       count(*) as customer_count,
       round(
          100.0 * count(*) /(
             select count(*)
               from classified
          ),
          2
       ) as customer_pct
  from classified
 group by customer_type
 order by customer_count desc;