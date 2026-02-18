select
    -- identifiers
    cast(VendorID as integer) as vendor_id,
    cast(RatecodeID as integer) as ratecode_id,
    cast(PULocationID as integer) as pickup_location_id,
    cast(DOLocationID as integer) as dropoff_location_id,
    
    -- timestamps
    cast(tpep_pickup_datetime as timestamp) as pickup_datetime,
    cast(tpep_dropoff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    store_and_fwd_flag,
    cast(passenger_count as integer) as passenger_count,
    cast(trip_distance as float64) as trip_distance,
    1 as trip_type, -- yellow taxi can only be street hails, so we can set this to 1 for all records

    -- payment info
    cast(fare_amount as numeric) as fare_amount,
    cast(extra as numeric) as extra,
    cast(mta_tax as numeric) as mta_tax,
    cast(tip_amount as numeric) as tip_amount,
    cast(tolls_amount as numeric) as tolls_amount,
    0 as ehail_fee, -- yellow taxi does not have e-hail fee, so we can set this to 0 for all records
    cast(improvement_surcharge as numeric) as improvement_surcharge,
    cast(total_amount as numeric) as total_amount,
    cast(payment_type as integer) as payment_type,
    cast(congestion_surcharge as numeric) as congestion_surcharge

from {{ source('bigquery_data', 'yellow_tripdata') }}
where VendorID is not null

