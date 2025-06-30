SELECT  distinct channel 
from {{ source('powerflow', 'appsflyer_raw') }}