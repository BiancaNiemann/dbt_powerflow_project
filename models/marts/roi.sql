{{
    config(
        materialized='table'
    )
}}

select 
    l.user_id,
    lifetime,
    cumulative_daily_revenue,
    channel,
    campaign_id,
    attribution_cost,
    div0(cumulative_daily_revenue, attribution_cost) as roi
from {{ ref('ltv') }} as l
inner join {{ ref('users_with_attribution') }} as a
on l.user_id = a.user_id