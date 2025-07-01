select
    user_id,
    registration_time,
    reg.device_id,
    attribution_time,
    coalesce(channel, 'organic') as channel,
    coalesce(campaign_id, 'organic') as campaign_id,
    coalesce(attribution_cost, 0) as attribution_cost
from {{ ref('stg_registrations_clean') }} as reg
left join {{ ref('marketing_attribution') }} as mar
on reg.device_id = mar.device_id
