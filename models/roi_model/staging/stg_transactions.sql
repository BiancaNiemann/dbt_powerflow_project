select 
    t.user_id,
    r.device_id,
    transaction_time::date as transaction_day,
    total_value
from {{ source('powerflow', 'transactions') }} as t
join {{ source('powerflow', 'registrations') }} as r
on t.user_id = r.user_id
where r.user_id is not null