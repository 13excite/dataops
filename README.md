# Dataops k8s cluster

This repository contains terraform and argocd configuration to deploy a dataops
k8s cluster.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [Docker](https://docs.docker.com/get-docker/)

## Components

- [ArgoCD](https://argoproj.github.io/argo-cd/)
- [Clickhouse](https://clickhouse.tech/)
- [Postgres](https://www.postgresql.org/)
- [Minio](https://min.io/)
- [Apache Airflow](https://airflow.apache.org/) **TODO**
- [JupyterHub](https://jupyter.org/hub) **TODO**
- [Spark](https://spark.apache.org/) **TODO**
- [Superset](https://superset.apache.org/) **TODO**

## URLs

Don't forget to add the following lines to your `/etc/hosts` file:

```bash
127.0.0.1 argocd.dataops
127.0.0.1 minio.dataops
127.0.0.1 console.minio.dataops
```

- ArgoCD: [http://argocd.dataops](http://argocd.dataops)
- Minio-Console: [http://console.minio.dataops](http://console.minio.dataops)
- Minio API: [http://minio.dataops](http://minio.dataops)

## Credentials

Default credentials:

- ArgoCD: admin/password
- Minio: minioadmin/minioadmin
