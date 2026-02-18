# Module 02: Workflow Orchestration with Kestra

This directory contains the orchestration logic for the NYC Taxi data pipeline using **Kestra**. It automates data movement from public sources to Google Cloud Storage (GCS) and BigQuery.


## Pipeline Overview

The workflow is designed to extract, load, and transform (ELT) the taxi dataset:

* **Extraction**: Downloads raw CSV files from the NYC Taxi dataset repository.
* **Loading (Data Lake)**: Uploads raw files to a GCS bucket.
* **Transformation & Loading (Data Warehouse)**: 
    * Creates External Tables in BigQuery.
    * Generates partitioned native tables for optimized performance.
    * Implements a `MERGE` strategy using MD5 hashing to ensure data idempotency.

## File Structure

* `08_gcp_taxi_hw.yaml`: Main ingestion pipeline for yellow and green taxi data.
* `08_taxi_backfill_challenge.yaml`: Subflow-based automation for processing historical data (2021).
* `02_kestra_setup.yaml`: Python script execution within Docker for metadata collection.
* `Key_Values_Auto.yaml`: Global configuration for GCP project, bucket, and dataset variables.

## Infrastructure Requirements

1.  **Docker Stack**: Kestra instance running as defined in [Module 01](../01-docker-terraform).
2.  **GCP Resources**: Bucket and Dataset must be provisioned (via Terraform).
3.  **Kestra KV Store**: Key-Values must be initialized using the provided setup flow.
4.  **Secrets**: A `GCP_CREDS` secret containing the Service Account JSON is required for cloud authentication.