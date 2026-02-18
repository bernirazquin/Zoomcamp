variable "credentials"{
  description = "My Credentials"
  type        = string
  default     = "/workspaces/Homework1-DE-zoomcamp/h1_terraform/terrademo/keys/my-creds.json"
}

variable "project" {
  description = "The GCP project ID where resources will be created."
  type        = string
  default     = "terraform-demo-485319"
}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
  default     = "us-central1"
}

variable "location" {
  description = "The location for the GCS bucket."
  type        = string
  default     = "US"
  
}

variable "bq_dataset_name" {
  description = "The name of the BigQuery dataset to be created."
  type        = string
    default     = "demo_dataset"
}

variable "gcs_storage_class" {
  description = "The storage class of the GCS bucket."
  type        = string
  default     = "STANDARD"
}

variable "gcs_bucket_name" {
  description = "GCS bucket name."
  type        = string
  default     = "terraform-demo-485319-terra-bucket"
}
