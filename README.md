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
$ DOCKER_BUILDKIT=1 docker buildx build -t repo-name/ksql-docker:latest --no-cache --progress=plain .
```
### Run

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3Mjk4MzUyMywxMDcwMzE4MDUyXX0=
-->