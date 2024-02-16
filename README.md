# Ksql Docker

Ksqldb docker image built with Oracle JDK 17 .

### Supported tags and respective Dockerfile links

-   latest ([Dockerfile](https://github.com/Dwijad/Ksql-Docker/blob/main/Dockerfile))

### [](https://github.com/Dwijad/Confluent-Schema-Registry#summary)

### Summary:

-  Debian "buster" image variant
-  Oracle JDK (build 17.0.10+11-LTS-240)
-  Oracle Java Cryptography Extension added
-  SHA 256 sum checks for all downloads
-  JAVA_HOME environment variable and net tools set up
-  Integrated kafka keystor and truststore certificate

### Build

To build from scratch, clone the repo and copy kafka keystore/truststore certificates and public certificate authority (CA) file of kafka broker to  `script/ca`  folder.

```
$ git clone https://github.com/Dwijad/Ksql-Docker.git
$ copy {ca-cert, kafka.truststore.jks, kafka.keystore.jks} to ~/Ksql-Docker/script/ca 
```
Build the docker image
```
$ DOCKER_BUILDKIT=1 docker buildx build -t <repo-name>/ksql-docker:<tag name> --no-cache --progress=plain .
```
### Run

    $ docker run -d --name=ksql-1 -e SCHEMA_REGISTRY_MODE="HTTPS" -e BROKER_LISTENER_MODE="SASL_SSL" -e SASL_USER="user1" -e SASL_PASSWORD="password" -e AUTHENTICATION_REALM="KsqlServerProps" localhost:5000/ksql-docker:latest

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTE4Mzg1NDM5NiwtMTcyOTgzNTIzLDEwNz
AzMTgwNTJdfQ==
-->