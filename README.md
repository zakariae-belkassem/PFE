
# 🚀 Final Year Internship Project (PFE)  
## HDFS and Spark Cluster Setup using Docker

This repository contains configuration files to set up a **Hadoop** and **Spark** cluster using Docker and Docker Compose. It also includes **Hive** services integrated with **PostgreSQL** for the Hive Metastore.

---

## 📦 Prerequisites

Make sure the following are installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## 🧩 Services Included

| Service                 | Description                              |
|------------------------|------------------------------------------|
| `namenode`             | Hadoop Namenode                          |
| `datanode`             | Hadoop Datanode                          |
| `hive-server`          | Hive Server                              |
| `hive-metastore`       | Hive Metastore                           |
| `hive-metastore-postgres` | PostgreSQL database for Hive Metastore |
| `spark-master`         | Spark Master node                        |
| `spark-worker`         | Spark Worker node                        |

---

## 💾 Volumes

Persistent storage is used for the following services:

- `namenode`
- `datanode`

---

## 🌐 Ports

| Component     | Port(s)         |
|---------------|-----------------|
| Namenode      | `50070`         |
| Datanode      | `50075`         |
| Hive Server   | `10000`         |
| Hive Metastore| `9083`          |
| Spark Master  | `7077`, `8080`  |
| Spark Worker  | `8081`          |

---

## ⚙️ Environment Variables

Environment variables for the cluster are defined in the `hadoop-hive.env` file.

---

## 🛠 Building the Docker Image for Spark

Before starting the cluster, build the custom Docker image for Spark:

1. Navigate to the directory containing the `Dockerfile` for Spark.
2. Run the following command:

```bash
docker build -t custom-spark:latest .
```

---

## ▶️ Starting the Cluster

To start the full cluster, simply run:

```bash
docker-compose up -d
```

This will launch all services defined in the `docker-compose.yml` file.

---

## ⏹️ Stopping the Cluster

To stop and remove all running services:

```bash
docker-compose down
```

---


## 📚 Notes

- Make sure all required ports are free on your host machine.
- You can extend this setup by adding more Spark workers or Hadoop nodes if needed.

---
