CREATE OR REPLACE TABLE taxi-analytics-project.taxi_data_engineering.taxi_analytics AS (
SELECT f.VendorID, d.tpep_pickup_datetime, d.tpep_dropoff_datetime, p.passenger_count, t.trip_distance, 
r.rate_code_name, pi.PUlocationID, dr.DOlocationID, pa.payment_type_name, f.fare_amount, f.extra, f.mta_tax, 
f.tip_amount, f.tolls_amount, f.improvement_surcharge, f.total_amount, f.congestion_surcharge, f.Airport_fee

FROM 
taxi-analytics-project.taxi_data_engineering.fact_table f 
JOIN taxi-analytics-project.taxi_data_engineering.datetime_dim d on f.datetime_id = d.datetime_id
JOIN taxi-analytics-project.taxi_data_engineering.passenger_count_dim p on f.passenger_count_id = p.passenger_count_id
JOIN taxi-analytics-project.taxi_data_engineering.trip_distance_dim t on f.trip_distance_id = t.trip_distance_id
JOIN taxi-analytics-project.taxi_data_engineering.rate_code_dim r on f.rate_code_id = r.rate_code_id
JOIN taxi-analytics-project.taxi_data_engineering.pickup_location_dim pi on f.pickup_location_id = pi.pickup_location_id
JOIN taxi-analytics-project.taxi_data_engineering.dropoff_location_dim dr on f.dropoff_location_id = dr.dropoff_location_id
JOIN taxi-analytics-project.taxi_data_engineering.payment_type_dim pa on f.payment_type_id = pa.payment_type_id);