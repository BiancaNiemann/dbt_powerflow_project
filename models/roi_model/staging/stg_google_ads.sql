select
    device_id,
    attribution_time,
    'Google_ads' as channel,
    campaign as campaign_id,
    cost as attribution_cost
from {{source("powerflow",'google_ads')}} as ga
left join {{ ref("campaign_cost") }} as c on ga.campaign = c.campaign_id