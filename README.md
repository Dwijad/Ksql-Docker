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

Name: SCHEMA_REGISTRY_VERSION 
Default value: 3.5.0
Description: Schema registry version
 
Name: LISTENERS 
Default value: http://0.0.0.0:8081, https://0.0.0.0:8082
Description: Comma-separated list of listeners that listen for API requests over either HTTP or HTTPS.

Name: SSL_KEYSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: SSL Keystore file

Name: SSL_KEYSTORE_PASSWORD 
Default value: password
Description: SSL Keystore password

Name:  SSL_TRUSTSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: SSL truststore file

Name:  SSL_CLIENT_AUTH 
Default value: false
Description: Whether or not to require the HTTPS client to authenticate via the server’s trust store.

Name:  SSL_ENDPOINT_IDENTIFICATION_ALGORITHM
Default value: Empty string
Description: The endpoint identification algorithm to validate the server hostname using the server certificate.

Name:  KAFKASTORE_SSL_KEY_PASSWORD
Default value: password
Description: Kafkastore key password

Name:  KAFKASTORE_SSL_KEYSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: Kafkastore SSL keystore location 

Name:  KAFKASTORE_SSL_KEYSTORE_PASSWORD 
Default value: password
Description: Kafkastore SSL keystore password 

Name:  KAFKASTORE_SSL_TRUSTSTORE_LOCATION 
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: Kafkastore SSL truststore location

Name:  KAFKASTORE_SSL_TRUSTSTORE_PASSWORD
Default value: password
Description: Kafkastore SSL truststore password    

Name:  KAFKASTORE_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM 
Default value: Empty string
Description: The endpoint identification algorithm to validate the kafka server hostname using the server certificate.
    
Name:  KAFKASTORE_BOOTSTRAP_SERVERS 
Default value: test-kafka.default.svc.cluster.local:9092
Description: Kafka broker endpoint 

Name:  KAFKASTORE_TOPIC 
Default value: _schemas
Description: The durable single partition topic that acts as the durable log for the data.
    
Name:   KAFKASTORE_SECURITY_PROTOCOL  
Default value: SASL_SSL
Description: The security protocol to use when connecting with Kafka, the underlying persistent storage.

Name:   INTER_INSTANCE_PROTOCOL  
Default value: http
Description: The protocol used while making calls between the instances of Schema Registry.

Name:   ACCESS_CONTROL_ALLOW_METHODS  
Default value: GET,POST,PUT,DELETE,OPTIONS,HEAD
Description: Set value to Jetty Access-Control-Allow-Origin header for specified methods.
   
Name:  ACCESS_CONTROL_ALLOW_ORIGIN
Default value: *
Description: Set value for Jetty `Access-Control-Allow-Origin` header
 
Name:   SCHEMA_COMPATIBILITY_LEVEL   
Default value: full
Description: The schema compatibility type.

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
eyJoaXN0b3J5IjpbMTg0Nzg1NzcyOSwtMTcyOTgzNTIzLDEwNz
AzMTgwNTJdfQ==
-->