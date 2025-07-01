select *
from {{ ref('stg_google_ads') }}
union 
select * from {{source('powerflow','appsflyer_raw')}}
