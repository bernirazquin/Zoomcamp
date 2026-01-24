# Homework1-DE-zoomcamp

## Question 1: Understanding Docker images
Executed this command:
`docker run -it --entrypoint bash python:3.13`
Inside the container I executed `pip --version`.
Version is 25.3


## Question 2:

postgres:5432 is the host name and port. 

## Question 3:

For Question 3 query was: 

SELECT 
    COUNT(*)
FROM 
    green_taxi_data
WHERE 
    lpep_pickup_datetime >= '2025-11-01 00:00:00' 
    AND lpep_pickup_datetime < '2025-12-01 00:00:00'
    AND trip_distance <= 1;

and the answer was 8007 

## Question 4: 

For question 4 the query was: 

SELECT 
    CAST(lpep_pickup_datetime AS DATE) AS pickup_day,
    MAX(trip_distance) AS max_distance
FROM green_taxi_data
WHERE trip_distance <= 100
GROUP BY pickup_day
ORDER BY max_distance DESC
LIMIT 1;


And the answer is: 2025-11-14

## Question 5: 

For question 5 the query was: 

SELECT 
    z."Zone", 
    SUM(t.total_amount) AS total_amount_sum
FROM 
    green_taxi_data t
JOIN 
    zones z ON t."PULocationID" = z."LocationID"
WHERE 
    CAST(t.lpep_pickup_datetime AS DATE) = '2025-11-18'
GROUP BY 
    z."Zone"
ORDER BY 
    total_amount_sum DESC
LIMIT 1;

and the answer was East Harlem North

## Question 6: 

For question 5 the query was: 

SELECT 
    zdo."Zone" AS dropoff_zone, 
    MAX(t.tip_amount) AS max_tip
FROM 
    green_taxi_data t
JOIN 
    zones zpu ON t."PULocationID" = zpu."LocationID"
JOIN 
    zones zdo ON t."DOLocationID" = zdo."LocationID"
WHERE 
    zpu."Zone" = 'East Harlem North'
    AND t.lpep_pickup_datetime >= '2025-11-01'
    AND t.lpep_pickup_datetime < '2025-12-01'
GROUP BY 
    zdo."Zone"
ORDER BY 
    max_tip DESC
LIMIT 1;

and the answer was Yorkville West