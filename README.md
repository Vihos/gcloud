# Python 3 GCloud Docker image

This image is based on Alpine Linux 3.10 image. It contains Python 3, Python 2 and several GCloud components installed:

|     Status    |                         Name                         |            ID            |   Size   |
|---------------|------------------------------------------------------|--------------------------|----------|
| Installed     | BigQuery Command Line Tool                           | bq                       |  < 1 MiB |
| Installed     | Cloud Datastore Emulator                             | cloud-datastore-emulator | 18.4 MiB |
| Installed     | Cloud SDK Core Libraries                             | core                     | 12.5 MiB |
| Installed     | Cloud Storage Command Line Tool                      | gsutil                   |  3.6 MiB |
| Installed     | gcloud app Python Extensions                         | app-engine-python        |  6.0 MiB |
| Not Installed | App Engine Go Extensions                             | app-engine-go            |  4.9 MiB |
| Not Installed | Appctl                                               | appctl                   | 21.0 MiB |
| Not Installed | Cloud Bigtable Command Line Tool                     | cbt                      |  7.5 MiB |
| Not Installed | Cloud Bigtable Emulator                              | bigtable                 |  6.6 MiB |
| Not Installed | Cloud Datalab Command Line Tool                      | datalab                  |  < 1 MiB |
| Not Installed | Cloud Firestore Emulator                             | cloud-firestore-emulator | 40.0 MiB |
| Not Installed | Cloud Pub/Sub Emulator                               | pubsub-emulator          | 34.9 MiB |
| Not Installed | Cloud SQL Proxy                                      | cloud_sql_proxy          |  3.8 MiB |
| Not Installed | Emulator Reverse Proxy                               | emulator-reverse-proxy   | 14.5 MiB |
| Not Installed | Google Cloud Build Local Builder                     | cloud-build-local        |  6.0 MiB |
| Not Installed | Google Container Registry's Docker credential helper | docker-credential-gcr    |  1.8 MiB |
| Not Installed | Skaffold                                             | skaffold                 | 22.1 MiB |
| Not Installed | gcloud Alpha Commands                                | alpha                    |  < 1 MiB |
| Not Installed | gcloud Beta Commands                                 | beta                     |  < 1 MiB |
| Not Installed | gcloud app Java Extensions                           | app-engine-java          | 62.0 MiB |
| Not Installed | gcloud app PHP Extensions                            | app-engine-php           |          |
| Not Installed | gcloud app Python Extensions (Extra Libraries)       | app-engine-python-extras | 27.1 MiB |
| Not Installed | kubectl                                              | kubectl                  |  < 1 MiB |

Usage Example
-------------

```bash
$ docker run --rm vihos/gcloud gcloud components list
```

Once you have run this command you will get printed full list of components installed to GCloud SDK! Or use it interactivelly:

```bash
$ docker run -it --rm vihos/gcloud /bin/sh
```