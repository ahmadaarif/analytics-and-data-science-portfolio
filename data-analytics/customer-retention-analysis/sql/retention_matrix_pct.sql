with base as (
   select customerid,
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
),cohort_counts as (
   select cohort_month,
          cohort_index,
          count(distinct customerid) as active_customers
     from joined
    group by cohort_month,
             cohort_index
),cohort_sizes as (
   select cohort_month,
          active_customers as cohort_size
     from cohort_counts
    where cohort_index = 1
)
select cc.cohort_month,
       cc.cohort_index,
       cc.active_customers,
       cs.cohort_size,
       round(
          100.0 * cc.active_customers / cs.cohort_size,
          2
       ) as retention_pct
  from cohort_counts cc
  join cohort_sizes cs
on cc.cohort_month = cs.cohort_month
 order by cc.cohort_month,
          cc.cohort_index;