# Data Engineering Zoomcamp

This repository contains my progress and projects for the Data Engineering Zoomcamp. The course focuses on the fundamentals of data engineering, covering infrastructure as code, workflow orchestration, data warehousing, and analytical processing.

### Project Goals
* Build scalable and automated ETL pipelines.
* Implement Infrastructure as Code (IaC) to manage cloud resources.
* Process large datasets using distributed computing frameworks.
* Design and manage data warehouses for efficient analytical querying.

### Tech Stack
* **Infrastructure as Code:** Terraform
* **Containerization:** Docker and Docker Compose
* **Workflow Orchestration:** kestra
* **Data Warehouse:** GCP BigQuery
* **Data Processing:** Python, SQL, Apache Spark
* **Data Lake:** Google Cloud Storage (GCS)
* **Stream Processing:** Kafka

### Repository Structure
I have organized this repository by tool and functional area rather than chronological modules. This structure reflects the connectivity between components and follows a more professional, production-oriented layout:

* **/docker:** Local database setup, containerization of ingestion scripts, and initial SQL explorations.
* **/terraform:** Infrastructure as Code (IaC) configuration for managing Google Cloud Platform (GCP) resources, including GCS buckets and BigQuery datasets.
* **/model_deployment:** Scripts and configurations for deploying and serving models within the data pipeline.
* **/analytics_engineering (modulo4):** Transformation layers and data modeling focusing on dbt (data build tool).
* **/orchestration:** Pipeline automation and workflow management using [Insert your tool, e.g., Kestra or Airflow].

### Architectural Approach
I decided to structure this repository based on tools rather than chronological modules. This approach allows for:
* **Modularity:** Easier management of dependencies specific to each tool.
* **Connectivity:** A clearer view of how different components of the stack interact (e.g., how the orchestrator triggers Spark jobs or dbt models).
* **Scalability:** The ability to update individual layers of the infrastructure without disrupting the logic of the entire project.

Due to interconectivity between modules, I decided to keep the folder structure separating between tools more than modules. 

### Key Learning Outcomes
* Managed Google Cloud Platform (GCP) resources using Terraform.
* Automated data ingestion from web sources into GCS and BigQuery.
* Applied data modeling techniques using dbt for analytical reporting.
* Handled batch and streaming data processing at scale.

### Contact
* **LinkedIn:** https://www.linkedin.com/in/bernardorazquin/
* **Email:** bernirazquinu@gmail.com
