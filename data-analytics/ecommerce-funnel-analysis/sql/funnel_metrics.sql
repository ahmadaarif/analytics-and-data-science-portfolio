-- Sequential funnel counts (user-level)
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
)
select 'view' as funnel_step,
       count(*) as users
  from user_flags
 where viewed = 1
union all
select 'cart' as funnel_step,
       count(*) as users
  from user_flags
 where viewed = 1
   and carted = 1
union all
select 'purchase' as funnel_step,
       count(*) as users
  from user_flags
 where viewed = 1
   and carted = 1
   and purchased = 1;