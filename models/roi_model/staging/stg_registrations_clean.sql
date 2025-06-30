{{
    config(
        materialized='table'
    )
}}

select *
from {{ source('powerflow', 'registrations') }}
where user_id is not null