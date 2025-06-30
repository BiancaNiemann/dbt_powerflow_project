SELECT *
from {{ ref('stg_google_ads') }}
UNION 
SELECT * from {{source('powerflow','appsflyer_raw')}}