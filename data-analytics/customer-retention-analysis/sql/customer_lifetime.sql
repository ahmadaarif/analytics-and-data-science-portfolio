select customerid,
       min(date(invoicedate)) as first_purchase_date,
       max(date(invoicedate)) as last_purchase_date,
       count(distinct invoiceno) as total_orders,
       round(
          sum(quantity * unitprice),
          2
       ) as total_revenue,
       cast((julianday(max(date(invoicedate))) - julianday(min(date(invoicedate)))) as integer) as tenure_days
  from retail_sales
 where customerid is not null
 group by customerid
 order by total_revenue desc;