#!/bin/bash -x

HOSTNAME=$(hostname -f)
KAFKA_HOME=/u01/cnfkfk

echo export KSQL_JMX_OPTS="-Djava.rmi.server.hostname=$HOSTNAME -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.rmi.port=1099 -javaagent:$KAFKA_HOME/etc/ksqldb/jmx_prometheus_javaagent-0.20.0.jar=7010:$KAFKA_HOME/etc/ksqldb/ksql-jmx.yml" >> ~/.bashrc
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
ksql.streams.state.dir=${KSQL_STREAMS_STATE_DIR:-$KAFKA_HOME/cnfkfk/etc/ksqldb/tmp}
ksql.streams.num.standby.replicas=${KSQL_STREAMS_NUM_STANDBY_REPLICAS:-1}
confluent.support.metrics.enable=${CONFLUENT_SUPPORT_METRICS_ENABLE:-false}
authentication.method=${AUTHENTICATION_METHOD:-BASIC}
authentication.roles=${AUTHENTICATION_ROLES:-admin,ksql,cli}
authentication.realm=${AUTHENTICATION_REALM:-KsqlServerProps}
EOF


bin/ksql-server-start $KAFKA_HOME/etc/ksqldb/ksql-server.properties &
sleep infinity
