#!/bin/bash -x

HOSTNAME=$(hostname -f)
KAFKA_HOME=/u01/cnfkfk

echo export KSQL_JMX_OPTS=\"-Djava.rmi.server.hostname='${HOSTNAME}' -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.rmi.port=1099 -javaagent:'${KAFKA_HOME}'/etc/ksqldb/jmx_prometheus_javaagent-0.20.0.jar=7010:'${KAFKA_HOME}'/etc/ksqldb/ksql-jmx.yml\" >> ~/.bashrc
echo export KSQL_OPTS=\"-Dauthentication.method=BASIC -Dauthentication.realm='${AUTHENTICATION_REALM}' -Dauthentication.roles=admin,user,cli -Djava.security.auth.login.config='${KAFKA_HOME}'/etc/ksqldb/jaas_config.file\" >> ~/.bashrc
echo export KSQL_LOG4J_OPTS=\"-Dlog4j.configuration=file:$KAFKA_HOME/etc/ksqldb/log4j-file-custom.properties\" >> ~/.bashrc
. .bashrc

cat << EOF > $KAFKA_HOME/etc/ksqldb/ksql-server.properties
bootstrap.servers=${BOOTSTRAP_SERVERS:-test-kafka.default.svc.cluster.local:9092}
ksql.service.id=${KSQL_SERVICE_ID:-hf_kafka_ksql_001}
ksql.streams.producer.delivery.timeout.ms=${KSQL_STREAMS_PRODUCER_DELIVERY_TIMEOUT_MS:-2147483647}
ksql.streams.producer.max.block.ms=${KSQL_STREAMS_PRODUCER_MAX_BLOCK_MS:-9223372036854775807}
ksql.internal.topic.replicas=${KSQL_INTERNAL_TOPIC_REPLICAS:-3}
ksql.internal.topic.min.insync.replicas=${KSQL_INTERNAL_TOPIC_MIN_INSYNC_REPLICAS:-2}
ksql.streams.replication.factor=${KSQL_STREAMS_REPLICATION_FACTOR:-3}
ksql.streams.producer.acks=${KSQL_STREAMS_PRODUCER_ACKS:-all}
ksql.streams.topic.min.insync.replicas=${KSQL_STREAMS_TOPIC_MIN_INSYNC_REPLICAS:-2}
ksql.streams.state.dir=${KSQL_STREAMS_STATE_DIR:-$KAFKA_HOME/etc/ksqldb/tmp}
ksql.streams.num.standby.replicas=${KSQL_STREAMS_NUM_STANDBY_REPLICAS:-1}
confluent.support.metrics.enable=${CONFLUENT_SUPPORT_METRICS_ENABLE:-false}
authentication.method=${AUTHENTICATION_METHOD:-BASIC}
authentication.roles=${AUTHENTICATION_ROLES:-admin,cli,user}
authentication.realm=${AUTHENTICATION_REALM:-KsqlServerProps}
EOF

if [[ "$BROKER_LISTENER_MODE" == "SASL_SSL" || "$BROKER_LISTENER_MODE" == "SSL" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
listeners=${LISTENERS:-https://0.0.0.0:8088}
advertised.listener=${ADVERTISED_LISTENER:-https://"${HOSTNAME}":8088}
EOF
fi

if [[ "$BROKER_LISTENER_MODE" == "SASL_PLAINTEXT" || "$BROKER_LISTENER_MODE" == "PLAINTEXT" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
listeners=${LISTENERS:-http://0.0.0.0:8088}
advertised.listener=${ADVERTISED_LISTENER:-http://"${HOSTNAME}":8088}
EOF
fi

if [[ "$SCHEMA_REGISTRY_MODE" == "HTTPS" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
ksql.schema.registry.url=${KSQL_SCHEMA_REGISTRY_URL:-https://sr-service-https:8082}
ksql.schema.registry.ssl.truststore.location=${KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
ksql.schema.registry.ssl.truststore.password=${KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_PASSWORD:-password}
ksql.schema.registry.ssl.keystore.location=${KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
ksql.schema.registry.ssl.keystore.password=${KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_PASSWORD:-password}
ksql.schema.registry.ssl.key.password=${KSQL_SCHEMA_REGISTRY_SSL_KEY_PASSWORD:-password}
EOF
fi

if [[ "$SCHEMA_REGISTRY_MODE" == "HTTP" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
ksql.schema.registry.url=${KSQL_SCHEMA_REGISTRY_URL:-http://sr-service-http:8081}
EOF
fi

if [[ "$BROKER_LISTENER_MODE" == "SASL_SSL" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
security.protocol=${SECURITY_PROTOCOL:-SASL_SSL}
sasl.mechanism=${SASL_MECHANISM:-PLAIN}
sasl.jaas.config=${SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
ssl.keystore.location=${SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
ssl.keystore.password=${SSL_KEYSTORE_PASSWORD:-password}
ssl.key.password=${SSL_KEY_PASSWORD:-password}
ssl.client.authentication=${SSL_CLIENT_AUTH:-NONE}
ssl.endpoint.identification.algorithm=${SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
ssl.truststore.location=${SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
ssl.truststore.password=${SSL_TRUSTSTORE_PASSWORD:-password}
producer.ssl.endpoint.identification.algorithm=${PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
producer.security.protocol=${PRODUCER_SECURITY_PROTOCOL:-SASL_SSL}
producer.sasl.mechanism=${PRODUCER_SASL_MECHANISM:-PLAIN}
producer.ssl.truststore.location=${PRODUCER_SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
producer.ssl.truststore.password=${PRODUCER_SSL_TRUSTSTORE_PASSWORD:-password}
producer.ssl.keystore.location=${PRODUCER_SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
producer.ssl.keystore.password=${PRODUCER_SSL_KEYSTORE_PASSWORD:-password}
producer.ssl.key.password=${PRODUCER_SSL_KEY_PASSWORD:-password}
producer.sasl.jaas.config=${PRODUCER_SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
consumer.ssl.endpoint.identification.algorithm=${CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
consumer.security.protocol=${CONSUMER_SECURITY_PROTOCOL:-SASL_SSL}
consumer.sasl.mechanism=${CONSUMER_SASL_MECHANISM:-PLAIN}
consumer.ssl.truststore.location=${CONSUMER_SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
consumer.ssl.truststore.password=${CONSUMER_SSL_TRUSTSTORE_PASSWORD:-password}
consumer.ssl.keystore.location=${CONSUMER_SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
consumer.ssl.keystore.password=${CONSUMER_SSL_KEYSTORE_PASSWORD:-password}
consumer.ssl.key.password=${CONSUMER_SSL_KEY_PASSWORD:-password}
consumer.sasl.jaas.config=${CONSUMER_SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
EOF
fi

if [[ "$BROKER_LISTENER_MODE" == "SASL_PLAINTEXT" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
security.protocol=${SECURITY_PROTOCOL:-SASL_PLAINTEXT}
sasl.mechanism=${SASL_MECHANISM:-PLAIN}
sasl.jaas.config=${SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
producer.security.protocol=${PRODUCER_SECURITY_PROTOCOL:-SASL_PLAINTEXT}
producer.sasl.mechanism=${PRODUCER_SASL_MECHANISM:-PLAIN}
producer.sasl.jaas.config=${PRODUCER_SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
consumer.security.protocol=${CONSUMER_SECURITY_PROTOCOL:-SASL_SSL}
consumer.sasl.mechanism=${CONSUMER_SASL_MECHANISM:-PLAIN}
consumer.sasl.jaas.config=${CONSUMER_SASL_JAAS_CONFIG:-org.apache.kafka.common.security.plain.PlainLoginModule required username="${SASL_USER}" password="${SASL_PASSWORD}";}
EOF
fi

if [[ "$BROKER_LISTENER_MODE" == "PLAINTEXT" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
security.protocol=${SECURITY_PROTOCOL:-PLAINTEXT}
producer.security.protocol=${PRODUCER_SECURITY_PROTOCOL:-PLAINTEXT}
consumer.security.protocol=${CONSUMER_SECURITY_PROTOCOL:-PLAINTEXT}
EOF
fi

if [[ "$BROKER_LISTENER_MODE" == "SSL" ]]; then
cat << EOF >> $KAFKA_HOME/etc/ksqldb/ksql-server.properties
security.protocol=${SECURITY_PROTOCOL:-SSL}
ssl.keystore.location=${SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
ssl.keystore.password=${SSL_KEYSTORE_PASSWORD:-password}
ssl.key.password=${SSL_KEY_PASSWORD:-password}
ssl.client.authentication=${SSL_CLIENT_AUTH:-true}
ssl.endpoint.identification.algorithm=${SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
ssl.truststore.location=${SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
ssl.truststore.password=${SSL_TRUSTSTORE_PASSWORD:-password}
producer.ssl.endpoint.identification.algorithm=${PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
producer.security.protocol=${PRODUCER_SECURITY_PROTOCOL:-SSL}
producer.ssl.truststore.location=${PRODUCER_SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
producer.ssl.truststore.password=${PRODUCER_SSL_TRUSTSTORE_PASSWORD:-password}
producer.ssl.keystore.location=${PRODUCER_SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
producer.ssl.keystore.password=${PRODUCER_SSL_KEYSTORE_PASSWORD:-password}
producer.ssl.key.password=${PRODUCER_SSL_KEY_PASSWORD:-password}
consumer.ssl.endpoint.identification.algorithm=${CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-}
consumer.security.protocol=${CONSUMER_SECURITY_PROTOCOL:-SSL}
consumer.ssl.truststore.location=${CONSUMER_SSL_TRUSTSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka.truststore.jks}
consumer.ssl.truststore.password=${CONSUMER_SSL_TRUSTSTORE_PASSWORD:-password}
consumer.ssl.keystore.location=${CONSUMER_SSL_KEYSTORE_LOCATION:-$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks}
consumer.ssl.keystore.password=${CONSUMER_SSL_KEYSTORE_PASSWORD:-password}
consumer.ssl.key.password=${CONSUMER_SSL_KEY_PASSWORD:-password}
EOF
fi

cat << EOF >> $KAFKA_HOME/etc/ksqldb/jaas_config.file
$AUTHENTICATION_REALM {
                        org.eclipse.jetty.jaas.spi.PropertyFileLoginModule required
                        file="$KAFKA_HOME/etc/ksqldb/password-file"
                        debug="true";
};
EOF

echo "fred: MD5:$(echo -n 'password' | md5sum | grep -o '^\S\+'),user,cli,admin" >> $KAFKA_HOME/etc/ksqldb/password-file

cat << EOF > $KAFKA_HOME/etc/ssl/client.properties
security.protocol=SASL_SSL
sasl.mechanism=SCRAM-SHA-256
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
    username="${SASL_USER}" \
    password="${SASL_PASSWORD}";
ssl.truststore.type=JKS
ssl.truststore.location=$KAFKA_HOME/etc/ssl/kafka.truststore.jks
ssl.truststore.password=${SSL_TRUSTSTORE_PASSWORD:-password}
ssl.keystore.type=JKS
ssl.keystore.location=$KAFKA_HOME/etc/ssl/kafka-broker-0.keystore.jks
ssl.keystore.password=${SSL_KEYSTORE_PASSWORD:-password}
ssl.endpoint.identification.algorithm=
EOF

bin/ksql-server-start $KAFKA_HOME/etc/ksqldb/ksql-server.properties &
sleep infinity
