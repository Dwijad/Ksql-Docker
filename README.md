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
-  Integrated kafka keystore and truststore certificate

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

### Environment variables:

Name: UID
Default value: 1000
Description: User ID used to build Dockerfile   

Name: GID
Default value: 1000
Description: Group ID used to build Dockerfile

Name: USERNAME 
Default value: kafka
Description: Kafka files/folder owner 
 
Name: LISTENERS 
Default value: https://0.0.0.0:8088
Description: Comma-separated list of listeners that listen for API requests over either HTTP or HTTPS.

Name: SSL_KEYSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: SSL Keystore file

Name: SSL_KEYSTORE_PASSWORD 
Default value: password
Description: SSL Keystore password

Name: SSL_TRUSTSTORE_PASSWORD 
Default value: password
Description: SSL Truststore password

Name:  SSL_TRUSTSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: SSL truststore file

Name:  SSL_CLIENT_AUTH 
Default value: None
Description: Whether or not to require the HTTPS client to authenticate via the server’s trust store.

Name:  SSL_ENDPOINT_IDENTIFICATION_ALGORITHM
Default value: Empty string
Description: The endpoint identification algorithm to validate the server hostname using the server certificate.

Name:  SSL_KEY_PASSWORD
Default value: password
Description: SSL key password

Name: CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM
Default value: Empty String
Description: Algorithm used by consumer to validate Kafka server host name.

Name: CONSUMER_SECURITY_PROTOCOL
Default value: SASL_SSL
Description: The security protocol used by consumer while connecting to kafka broker.

Name: CONSUMER_SSL_TRUSTSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: The SSL truststore location for consumer. 

Name: CONSUMER_SSL_TRUSTSTORE_PASSWORD
Default value: password
Description: The SSL truststore password for consumer.

Name: CONSUMER_SSL_KEYSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: The SSL keystore location for consumer. 

Name: CONSUMER_SSL_KEYSTORE_PASSWORD
Default value: password
Description: The SSL keystore password for consumer.

Name: CONSUMER_SSL_KEY_PASSWORD
Default value: password
Description: The SSL key password for consumer.

Name: CONSUMER_SASL_MECHANISM
Default value: PLAIN
Description: The SASL mechanism consumer uses to connect Kafka broker.


Name:   SCHEMA_REGISTRY_JMX_OPTS   
Default value: "-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.rmi.port=8080 -Djava.rmi.server.hostname=schema-registry-0 -javaagent:/u01/cnfkfk/etc/schema-registry/jmx_prometheus_javaagent-0.20.0.jar=8080:/u01/cnfkfk/etc/schema-registry/jmx-schema-registry-prometheus.yml"
Description: JMX options. Use this variable to override the default JMX options

Name:   SCHEMA_REGISTRY_JMX_ENABLED   
Default value: None
Description: Whether JMX should be enabled or not.

Name:   SCHEMA_REGISTRY_HOST_NAME   
Default value: Default hostname of the container.
Description: Hostname of the schema registry server.         

Name:   SCHEMA_REGISTRY_JMX_HOSTNAME  
Default value: Default hostname of the container.
Description: JMX Hostname of the schema registry server. 

Name:   SCHEMA_REGISTRY_JMX_PORT 
Default value: 8080
Description: Schema registry JMX port.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk4MzUzNjYwNywtNTk0MjI3NDY0LDE4ND
c4NTc3MjksLTE3Mjk4MzUyMywxMDcwMzE4MDUyXX0=
-->