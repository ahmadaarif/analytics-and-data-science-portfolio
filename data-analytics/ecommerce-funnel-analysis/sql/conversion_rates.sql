-- Funnel conversion rates + drop-offs (sequential user-level funnel)
with user_flags as (
   select user_id,
          max(
             case
                when event_type = 'view' then
                   1
                else
                   0
             end
          ) as viewed,
          max(
             case
                when event_type = 'cart' then
                   1
                else
                   0
             end
          ) as carted,
          max(
             case
                when event_type = 'purchase' then
                   1
                else
                   0
             end
          ) as purchased
     from funnel_events
    group by user_id
),funnel_counts as (
   select 1 as step_order,
          'view' as step,
          count(*) as users
     from user_flags
    where viewed = 1
   union all
   select 2 as step_order,
          'cart' as step,
          count(*) as users
     from user_flags
    where viewed = 1
      and carted = 1
   union all
   select 3 as step_order,
          'purchase' as step,
          count(*) as users
     from user_flags
    where viewed = 1
      and carted = 1
      and purchased = 1
)
select step,
       users,
       round(
          users * 1.0 / lag(users)
                        over(
              order by step_order
                        ),
          4
       ) as step_conversion,
       ( lag(users)
         over(
           order by step_order
         ) - users ) as drop_off_users,
       round(
          1 -(users * 1.0 / lag(users)
                            over(
              order by step_order
                            )),
          4
       ) as drop_off_rate
  from funnel_counts
 order by step_order;