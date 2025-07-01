with reg as (
    select 
        distinct user_id,
        date(min(registration_time)) as reg_date
    from {{ ref('stg_registrations_clean') }}
    group by user_id
),
daily_purch as (
    select
        user_id,
        date(transaction_time) as transaction_date,
        sum(total_value) as daily_revenue
    from {{ source('powerflow', 'transactions') }}
    group by user_id, transaction_date
)
select 
    p.user_id,
    transaction_date,
    reg_date,
    datediff(day, reg_date, transaction_date) as lifetime,
    daily_revenue,
    sum(daily_revenue) over (partition by p.user_id ORDER BY p.transaction_date) as cumulative_daily_revenue
    from daily_purch as p
    left join reg as r 
    on p.user_id = r.user_id
    order by p.user_id, transaction_date