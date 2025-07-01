select 
    channel,
    campaign_id,
    device_id, 
    attribution_time::date as attribution_date,
    attribution_cost
from {{ source('powerflow', 'appsflyer_raw') }}
