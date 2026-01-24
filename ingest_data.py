import pandas as pd
from sqlalchemy import create_engine
import sys

def main():
    # Database connection parameters
    user = 'root'
    password = 'root'
    host = 'localhost'
    port = '5433'
    db = 'ny_taxi'
    
    # Create connection string
    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')

    # --- Process Green Taxi Trip Data (Parquet) ---
    print("Reading green taxi parquet file...")
    df_trips = pd.read_parquet('green_tripdata_2025-11.parquet')

    # Convert pickup and dropoff columns to datetime objects
    df_trips.lpep_pickup_datetime = pd.to_datetime(df_trips.lpep_pickup_datetime)
    df_trips.lpep_dropoff_datetime = pd.to_datetime(df_trips.lpep_dropoff_datetime)

    print("Uploading trip data to Postgres...")
    df_trips.to_sql(name='green_taxi_data', con=engine, if_exists='replace', index=False)
    print("Trip data successfully uploaded.")

    # --- Process Taxi Zones (CSV) ---
    print("Reading taxi zones CSV...")
    df_zones = pd.read_csv('taxi_zone_lookup.csv')

    print("Uploading zones to Postgres...")
    df_zones.to_sql(name='zones', con=engine, if_exists='replace', index=False)
    print("Zones successfully uploaded.")

if __name__ == '__main__':
    main()