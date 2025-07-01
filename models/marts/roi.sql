{{
    config(
        materialized='table'
    )
}}

select 
    l.user_id,
    channel,
    campaign_id,
    max(lifetime),
    max(cumulative_daily_revenue),
    sum(attribution_cost),
    sum(div0(cumulative_daily_revenue, attribution_cost)) as roi
from {{ ref('ltv') }} as l
inner join {{ ref('users_with_attribution') }} as a
on l.user_id = a.user_id
group by 1,2,3