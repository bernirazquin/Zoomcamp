# Module 03: Data Warehouse (BigQuery)

This directory contains SQL queries and homework solutions for the BigQuery module. The focus was on data storage optimization through partitioning and clustering.

## Concepts Implemented

* **External Tables**: Creating tables that reference data stored in GCS (Parquet/CSV) without moving it to BigQuery.
* **Partitioning**: Organizing data by `tpep_pickup_datetime` to reduce the amount of data scanned during queries.
* **Clustering**: Sorting data by specific columns (like `VendorID`) to improve query performance on large datasets.

## Key Queries

The `queries.sql` file includes:
1. Creation of External Tables from GCS.
2. Creation of Partitioned and Clustered Tables.
3. Performance benchmarks comparing scanned data sizes between optimized and non-optimized tables.

## Requirements

* Access to a Google Cloud Project with BigQuery enabled.
* Data previously loaded into GCS via the [Module 02](../02-workflow-orchestration) pipelines.