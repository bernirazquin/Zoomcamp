with green_tripdata as (
    select * from {{ ref('int_trips_unioned') }}
), 

yellow_tripdata as (
    select * from {{ ref('int_trips_unioned') }}
)

trips_unioned as (
    select * from green_tripdata
    union all
    select * from yellow_tripdata
)

select * from trips_unioned
union all 