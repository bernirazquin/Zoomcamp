with green_tripdata as (
    select * from {{ ref('stg_green_tripdata') }}
), 

yellow_tripdata as (
    select * from {{ ref('stg_yellow_tripdata') }}
),

trips_unioned as (
    select * from green_tripdata
    union all
    select * from yellow_tripdata
)

select distinct 
    vendor_id 
from {{ ref('int_trips_unioned') }}
where pickup_datetime >= '2021-01-01'
limit 300