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

Name: CONSUMER_SASL_JAAS_CONFIG 
Default value: org.apache.kafka.common.security.plain.PlainLoginModule
Description: Specify the consumer JAAS configuration.

Name: PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM
Default value: Empty String
Description: Algorithm used by producer to validate Kafka server host name.

Name: PRODUCER_SECURITY_PROTOCOL
Default value: SASL_SSL
Description: The security protocol used by producer while connecting to kafka broker.

Name: PRODUCER_SSL_TRUSTSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: The SSL truststore location for producer. 

Name: PRODUCER_SSL_TRUSTSTORE_PASSWORD
Default value: password
Description: The SSL truststore password for producer.

Name: PRODUCER_SSL_KEYSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: The SSL keystore location for producer. 

Name: PRODUCER_SSL_KEYSTORE_PASSWORD
Default value: password
Description: The SSL keystore password for producer.

Name: PRODUCER_SSL_KEY_PASSWORD
Default value: password
Description: The SSL key password for producer.

Name: PRODUCER_SASL_MECHANISM
Default value: PLAIN
Description: The SASL mechanism producer uses to connect Kafka broker.

Name: PRODUCER_SASL_JAAS_CONFIG 
Default value: org.apache.kafka.common.security.plain.PlainLoginModule
Description: Specify the producer JAAS configuration.

Name: SASL_USER
Default value: user1
Description: BASIC username.

Name: SASL_PASSWORD
Default value: password
Description: Password for SASL_USER.

Name: KSQL_JMX_PORT
Default value: 8080
Description: The JMX Port.

Name: KSQL_JMX_HOSTNAME
Default value: connect-worker-1
Description: The hostname associated with locally created remote objects.

Name: KSQL_JMX_OPTS
Default value: "-Djava.rmi.server.hostname='${HOSTNAME}' -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.rmi.port=1099 -javaagent:'${KAFKA_HOME}'/etc/ksqldb/jmx_prometheus_javaagent-0.20.0.jar=7010:'${KAFKA_HOME}'/etc/ksqldb/ksql-jmx.yml"
Description: The JMX options.

Name: SASL_JAAS_CONFIG
Default value: org.apache.kafka.common.security.plain.PlainLoginModule
Description: Specify the JAAS configuration ksql uses to connect kafka broker.

Name: SASL_MECHANISM
Default value: PLAIN
Description: The sasl mechanism ksql uses to connect Kafka broker.

Name: BROKER_LISTENER_MODE
Default value: SASL_SSL
Description: Kafka Broker listener mode.

Name: SCHEMA_REGISTRY_MODE
Default value: HTTPS
Description: Ksql connection protocol to schema registry. Values can be either HTTP or HTTPS

Name: KSQL_OPTS
Default value: -Dauthentication.method=BASIC -Dauthentication.realm=KsqlServerProps -Dauthentication.roles=admin -Djava.security.auth.login.config=/u01/cnfkfk/etc/ksqldb/jaas_config.file
Description: Environment variable to set ksql server settings  

Name: KSQL_HEAP_OPTS
Default value: -Xmx512M -Xms512M
Description: Set the JVM heap size on the host

Name: SECURITY_PROTOCOL
Default value: SASL_SSL
Description: The security protocol used by ksql while connecting to kafka broker.

Name: KSQL_SCHEMA_REGISTRY_URL
Default value: https://sr-service-https:8082
Description: Schema registry URL.

Name: KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_PASSWORD
Default value: password
Description: SSL truststore password while connecting to secured schema registry server.

Name: KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka.truststore.jks
Description: SSL truststore location while connecting to secured schema registry server.

Name: KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_PASSWORD
Default value: password
Description: SSL keystore password while connecting to secured schema registry server.

Name: KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_LOCATION
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: SSL keystore location while connecting to secured schema registry server.

Name: KSQL_SCHEMA_REGISTRY_SSL_KEY_PASSWORD
Default value: password
Description: SSL key password while connecting to secured schema registry server.

Name: KSQL_STREAMS_PRODUCER_DELIVERY_TIMEOUT_MS
Default value: 300000
Description: The maximum amount of time, in milliseconds, a task might stall due to internal errors and retries until an error is raised. 

Name: KSQL_STREAMS_PRODUCER_MAX_BLOCK_MS
Default value: 9223372036854775807
Description: This allows KSQL to pause processing if the underlying Kafka cluster is unavailable.

Name: KSQL_STREAMS_REPLICATION_FACTOR
Default value: 3
Description: Specifies the replication factor of internal topics that Kafka Streams creates when local states are used or a stream is repartitioned for aggregation.

Name: KSQL_STREAMS_PRODUCER_ACKS
Default value: all
Description: acks setting guarantees that a record will not be lost as long as one replica is alive.

Name: KSQL_STREAMS_TOPIC_MIN_INSYNC_REPLICAS
Default value: 2
Description: Configure underlying Kafka Streams internal topics in order to achieve better fault tolerance

Name: KSQL_STREAMS_STATE_DIR
Default value: /u01/cnfkfk/etc/ksqldb/tmp
Description: Sets the storage directory for stateful operations, like aggregations and joins, to a durable location.

Name: KSQL_STREAMS_STATE_DIR
Default value: /u01/cnfkfk/etc/ssl/kafka-broker-0.keystore.jks
Description: /u01/cnfkfk/etc/ksqldb/tmp

Name: KSQL_STREAMS_NUM_STANDBY_REPLICAS
Default value: 1
Description: Sets the number of hot-standby replicas of internal state to maintain.

Name: BOOTSTRAP_SERVERS
Default value: test-kafka.default.svc.cluster.local:9092
Description: A list of host and port pairs that is used for establishing the initial connection to the Kafka cluster. 

Name: ADVERTISED_LISTENER
Default value: https://<HOST_NAME>:8088
Description: This is the URL used for inter-node communication.

Name: KSQL_SERVICE_ID
Default value: hf_kafka_ksql_001
Description: The service ID of the ksqlDB server. This is used to define the ksqlDB cluster membership of a ksqlDB Server instance.

Name: CONFLUENT_SUPPORT_METRICS_ENABLE
Default value: false
Description: Enables Confluent Metrics Reporter.

Name: KSQL_INTERNAL_TOPIC_REPLICAS
Default value: 3
Description: The number of replicas for the internal topics created by ksqlDB Server. 

Name: KSQL_INTERNAL_TOPIC_MIN_INSYNC_REPLICAS
Default value: 2
Description: Minimum number of Ksql internal topics insync replicas.
Name: AUTHENTICATION_METHOD
Default value: BASIC
Description: KsqlDB user authentication method

Name: AUTHENTICATION_ROLES
Default value: admin,user,cli
Description: A comma-separated list of user roles with access to the ksqlDB server. 

Name: AUTHENTICATION_REALM
Default value: KsqlServerProps
Description: Authentication realm to use by Ksqldb server. The config must match a section within jaas_config.file.




```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc1NzY5NjcyNiwtNTMxMjk5ODQxLDE5OD
A3NTA1NjIsODIwNjI3NDQ5LC0xMTIxMTI2MTUyLDk5MjE0ODQ4
NywtMTQzODkzNzQ3MSwxOTk1NDA2Mjc5LC01MDg2ODczODUsLT
U5NDIyNzQ2NCwxODQ3ODU3NzI5LC0xNzI5ODM1MjMsMTA3MDMx
ODA1Ml19
-->