with base as (
   select customerid,
          invoiceno,
          date(invoicedate) as invoice_date,
          strftime(
             '%Y-%m-01',
             invoicedate
          ) as purchase_month
     from retail_sales
    where customerid is not null
),cohort as (
   select customerid,
          min(purchase_month) as cohort_month
     from base
    group by customerid
),joined as (
   select b.customerid,
          b.purchase_month,
          c.cohort_month,
          ( ( cast(strftime(
             '%Y',
             b.purchase_month
          ) as integer) - cast(strftime(
             '%Y',
             c.cohort_month
          ) as integer) ) * 12 + ( cast(strftime(
             '%m',
             b.purchase_month
          ) as integer) - cast(strftime(
             '%m',
             c.cohort_month
          ) as integer) ) + 1 ) as cohort_index
     from base b
     join cohort c
   on b.customerid = c.customerid
)
select cohort_month,
       cohort_index,
       count(distinct customerid) as active_customers
  from joined
 group by cohort_month,
          cohort_index
 order by cohort_month,
          cohort_index;