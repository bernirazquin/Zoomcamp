with trips as (
    select * from {{ ref('int_trips_unioned') }}
),

vendors as (
    select * from {{ ref('dim_vendors') }}
),

zones as (
    select * from {{ ref('dim_zones') }}
),

fact_trips as (
    select
        -- primary key
        farm_fingerprint(concat(
            cast(trips.vendor_id as string),
            cast(trips.pickup_datetime as string),
            cast(trips.pickup_location_id as string),
            cast(trips.dropoff_location_id as string)
        )) as trip_id,
        
        -- identifiers
        trips.vendor_id,
        vendors.vendor_name,
        trips.ratecode_id,
        trips.pickup_location_id,
        zones.zone as pickup_zone,
        zones.borough as pickup_borough,
        trips.dropoff_location_id,
        
        -- timestamps
        trips.pickup_datetime,
        trips.dropoff_datetime,
        
        -- trip info
        trips.store_and_fwd_flag,
        trips.passenger_count,
        trips.trip_distance,
        trips.trip_type,
        
        -- payment info
        trips.fare_amount,
        trips.extra,
        trips.mta_tax,
        trips.tip_amount,
        trips.tolls_amount,
        trips.ehail_fee,
        trips.improvement_surcharge,
        trips.total_amount,
        trips.payment_type,
        
        -- payment_type description
        case trips.payment_type
            when 1 then 'Credit card'
            when 2 then 'Cash'
            when 3 then 'No charge'
            when 4 then 'Dispute'
            when 5 then 'Unknown'
            when 6 then 'Voided trip'
            else 'EMPTY'
        end as payment_type_description,

        trips.congestion_surcharge
    from trips
    left join vendors on trips.vendor_id = vendors.vendor_id
    left join zones on trips.pickup_location_id = zones.location_id
)

-- duplicate trips are caused by the union of the two datasets (yellow and green taxis), so we need to remove them by keeping only one record per trip_id
select * except (rn) from (
    select *,
        row_number() over(partition by trip_id order by pickup_datetime) as rn
    from fact_trips
)
where rn = 1