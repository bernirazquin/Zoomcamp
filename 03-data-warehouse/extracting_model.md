# Module 06: Model Deployment (NYC Taxi Tip Prediction)

This module covers the end-to-end process of extracting a Machine Learning model trained in **BigQuery ML** and deploying it as a **REST API** using **Docker** and **TensorFlow Serving**.

---

## Pipeline Execution

To deploy the model locally, the following steps are performed to move the model from the cloud environment to a serving container:

1. **Extract from BigQuery**: Use the `bq` tool to export the trained model to a GCS bucket.
2. **Local Staging**: Download the files and organize them into the versioned directory structure required by TensorFlow Serving.
3. **Containerized Serving**: Launch a Docker container that mounts the local directory and exposes a REST endpoint.
4. **Validation**: Test the API using `curl` with a sample payload.



---

### Deployment Commands

```bash
# 1. Model Extraction from BigQuery ML to GCS
gcloud auth login
bq --project_id taxi-rides-ny extract -m nytaxi.tip_model gs://taxi_ml_model/tip_model

# 2. Local Setup and Versioning
mkdir /tmp/model
gsutil cp -r gs://taxi_ml_model/tip_model /tmp/model
mkdir -p serving_dir/tip_model/1
cp -r /tmp/model/tip_model/* serving_dir/tip_model/1

# 3. Serving with Docker
docker pull tensorflow/serving
docker run -p 8501:8501 \
  --mount type=bind,source=$(pwd)/serving_dir/tip_model,target=/models/tip_model \
  -e MODEL_NAME=tip_model \
  -t tensorflow/serving &

# 4. Testing Inference (Prediction)
curl -d '{"instances": [{"passenger_count":1, "trip_distance":12.2, "PULocationID":"193", "DOLocationID":"264", "payment_type":"2","fare_amount":20.4,"tolls_amount":0.0}]}' \
  -X POST http://localhost:8501/v1/models/tip_model:predict
```

---

## API Endpoints

- **Inference**: `http://localhost:8501/v1/models/tip_model:predict`
- **Metadata/Status**: `http://localhost:8501/v1/models/tip_model`

---

## Requirements

- **Google Cloud SDK**: `gcloud`, `bq`, `gsutil`
- **Docker**: Desktop or Engine
- **GCP Access**: Access to the GCP project containing the `nytaxi.tip_model`