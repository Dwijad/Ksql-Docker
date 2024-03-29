FROM debian:buster

ARG kafka_version=3.5.0 \
    kafka_connect_version=3.5.0 \
    scala_version=2.13 \
    vcs_ref=unspecified \
    build_date=unspecified \
    UID=1000 \
    GID=1000 \
    USERNAME=kafka \
    BOOTSTRAP_SERVERS \
    LISTENERS \
    ADVERTISED_LISTENER \
    KSQL_SERVICE_ID \
    KSQL_STREAMS_PRODUCER_DELIVERY_TIMEOUT_MS \
    KSQL_STREAMS_PRODUCER_MAX_BLOCK_MS \
    KSQL_INTERNAL_TOPIC_REPLICAS \
    KSQL_INTERNAL_TOPIC_MIN_INSYNC_REPLICAS \
    KSQL_STREAMS_REPLICATION_FACTOR \
    KSQL_STREAMS_PRODUCER_ACKS \
    KSQL_STREAMS_TOPIC_MIN_INSYNC_REPLICAS \
    KSQL_STREAMS_STATE_DIR \
    KSQL_STREAMS_NUM_STANDBY_REPLICAS \
    CONFLUENT_SUPPORT_METRICS_ENABLE \
    SSL_TRUSTSTORE_LOCATION \
    SSL_TRUSTSTORE_PASSWORD \
    SSL_KEYSTORE_LOCATION \
    SSL_KEYSTORE_PASSWORD \
    SSL_KEY_PASSWORD \
    SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    SSL_CLIENT_AUTH \
    AUTHENTICATION_METHOD \
    AUTHENTICATION_ROLES \
    AUTHENTICATION_REALM \
    SECURITY_PROTOCOL \
    SASL_MECHANISM \
    SASL_JAAS_CONFIG \
    KSQL_SCHEMA_REGISTRY_URL \
    KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_LOCATION \
    KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_PASSWORD \
    KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_LOCATION \
    KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_PASSWORD \
    KSQL_SCHEMA_REGISTRY_SSL_KEY_PASSWORD \
    PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    PRODUCER_SECURITY_PROTOCOL \
    PRODUCER_SASL_MECHANISM \
    PRODUCER_SSL_TRUSTSTORE_LOCATION \
    PRODUCER_SSL_TRUSTSTORE_PASSWORD \
    PRODUCER_SSL_KEYSTORE_LOCATION \
    PRODUCER_SSL_KEYSTORE_PASSWORD \
    PRODUCER_SSL_KEY_PASSWORD \
    PRODUCER_SASL_MECHANISM \
    PRODUCER_SASL_JAAS_CONFIG \
    CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    CONSUMER_SECURITY_PROTOCOL \
    CONSUMER_SASL_MECHANISM \
    CONSUMER_SSL_TRUSTSTORE_LOCATION \
    CONSUMER_SSL_TRUSTSTORE_PASSWORD \
    CONSUMER_SSL_KEYSTORE_LOCATION \
    CONSUMER_SSL_KEYSTORE_PASSWORD \
    CONSUMER_SSL_KEY_PASSWORD \
    CONSUMER_SASL_MECHANISM \
    CONSUMER_SASL_JAAS_CONFIG \
    SASL_USER \
    SASL_PASSWORD \ 
    KSQL_JMX_PORT \
    KSQL_JMX_HOSTNAME \
    KSQL_JMX_OPTS \
    KSQL_HEAP_OPTS \
    KSQL_OPTS \
    BROKER_LISTENER_MODE \
    KSQL_QUERY_PULL_METRICS_ENABLED \
    SCHEMA_REGISTRY_MODE

LABEL org.label-schema.name="Ksql" \
      org.label-schema.description="Ksql" \
      org.label-schema.build-date="${build_date}" \
      org.label-schema.vcs-url="https://github.com/Dwijad/Ksql-Docker.git" \
      org.label-schema.vcs-ref="${vcs_ref}" \
      org.label-schema.version="${scala_version}_${kafka_version}" \
      org.label-schema.schema-version="1.0" \
      maintainer="dwijad"

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/u01/cnfkfk \
    BOOTSTRAP_SERVERS=$BOOTSTRAP_SERVERS \
    LISTENERS=$LISTENERS \
    ADVERTISED_LISTENER=$ADVERTISED_LISTENER \
    KSQL_SERVICE_ID=$KSQL_SERVICE_ID \
    KSQL_STREAMS_PRODUCER_DELIVERY_TIMEOUT_MS=$KSQL_STREAMS_PRODUCER_DELIVERY_TIMEOUT_MS \
    KSQL_STREAMS_PRODUCER_MAX_BLOCK_MS=$KSQL_STREAMS_PRODUCER_MAX_BLOCK_MS \
    KSQL_INTERNAL_TOPIC_REPLICAS=$KSQL_INTERNAL_TOPIC_REPLICAS \
    KSQL_INTERNAL_TOPIC_MIN_INSYNC_REPLICAS=$KSQL_INTERNAL_TOPIC_MIN_INSYNC_REPLICAS \
    KSQL_STREAMS_REPLICATION_FACTOR=$KSQL_STREAMS_REPLICATION_FACTOR \
    KSQL_STREAMS_PRODUCER_ACKS=$KSQL_STREAMS_PRODUCER_ACKS \
    KSQL_STREAMS_TOPIC_MIN_INSYNC_REPLICAS=$KSQL_STREAMS_TOPIC_MIN_INSYNC_REPLICAS \
    KSQL_STREAMS_STATE_DIR=$KSQL_STREAMS_STATE_DIR \
    KSQL_STREAMS_NUM_STANDBY_REPLICAS=$KSQL_STREAMS_NUM_STANDBY_REPLICAS \
    CONFLUENT_SUPPORT_METRICS_ENABLE=$CONFLUENT_SUPPORT_METRICS_ENABLE \
    SSL_TRUSTSTORE_LOCATION=$SSL_TRUSTSTORE_LOCATION \
    SSL_TRUSTSTORE_PASSWORD=$SSL_TRUSTSTORE_PASSWORD \
    SSL_KEYSTORE_LOCATION=$SSL_KEYSTORE_LOCATION \
    SSL_KEYSTORE_PASSWORD=$SSL_KEYSTORE_PASSWORD \
    SSL_KEY_PASSWORD=$SSL_KEY_PASSWORD \
    SSL_ENDPOINT_IDENTIFICATION_ALGORITHM=$SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    SSL_CLIENT_AUTH=$SSL_CLIENT_AUTH \
    AUTHENTICATION_METHOD=$AUTHENTICATION_METHOD \
    AUTHENTICATION_ROLES=$AUTHENTICATION_ROLES \
    AUTHENTICATION_REALM=$AUTHENTICATION_REALM \
    SECURITY_PROTOCOL=$SECURITY_PROTOCOL \
    SASL_MECHANISM=$SASL_MECHANISM \
    SASL_JAAS_CONFIG=$SASL_JAAS_CONFIG \
    KSQL_SCHEMA_REGISTRY_URL=$KSQL_SCHEMA_REGISTRY_URL \
    KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_LOCATION=$KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_LOCATION \
    KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_PASSWORD=$KSQL_SCHEMA_REGISTRY_SSL_TRUSTSTORE_PASSWORD \
    KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_LOCATION=$KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_LOCATION \
    KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_PASSWORD=$KSQL_SCHEMA_REGISTRY_SSL_KEYSTORE_PASSWORD \
    KSQL_SCHEMA_REGISTRY_SSL_KEY_PASSWORD=$KSQL_SCHEMA_REGISTRY_SSL_KEY_PASSWORD \
    PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM=$PRODUCER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    PRODUCER_SECURITY_PROTOCOL=$PRODUCER_SECURITY_PROTOCOL \
    PRODUCER_SASL_MECHANISM=$PRODUCER_SASL_MECHANISM \
    PRODUCER_SSL_TRUSTSTORE_LOCATION=$PRODUCER_SSL_TRUSTSTORE_LOCATION \
    PRODUCER_SSL_TRUSTSTORE_PASSWORD=$PRODUCER_SSL_TRUSTSTORE_PASSWORD \
    PRODUCER_SSL_KEYSTORE_LOCATION=$PRODUCER_SSL_KEYSTORE_LOCATION \
    PRODUCER_SSL_KEYSTORE_PASSWORD=$PRODUCER_SSL_KEYSTORE_PASSWORD \
    PRODUCER_SASL_JAAS_CONFIG=$PRODUCER_SASL_JAAS_CONFIG \
    CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM=$CONSUMER_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM \
    CONSUMER_SECURITY_PROTOCOL=$CONSUMER_SECURITY_PROTOCOL \
    CONSUMER_SASL_MECHANISM=$CONSUMER_SASL_MECHANISM \
    CONSUMER_SSL_TRUSTSTORE_LOCATION=$CONSUMER_SSL_TRUSTSTORE_LOCATION \
    CONSUMER_SSL_TRUSTSTORE_PASSWORD=$CONSUMER_SSL_TRUSTSTORE_PASSWORD \
    CONSUMER_SSL_KEYSTORE_LOCATION=$CONSUMER_SSL_KEYSTORE_LOCATION \
    CONSUMER_SSL_KEYSTORE_PASSWORD=$CONSUMER_SSL_KEYSTORE_PASSWORD \
    CONSUMER_SASL_JAAS_CONFIG=$CONSUMER_SASL_JAAS_CONFIG \
    SASL_USER=$SASL_USER \
    SASL_PASSWORD=$SASL_PASSWORD \ 
    KSQL_JMX_PORT=$KSQL_JMX_PORT \
    KSQL_JMX_HOSTNAME=$KSQL_JMX_HOSTNAME \
    KSQL_JMX_OPTS=$KSQL_JMX_OPTS \
    KSQL_HEAP_OPTS=$KSQL_HEAP_OPTS \
    KSQL_OPTS=$KSQL_OPTS \
    BROKER_LISTENER_MODE=$BROKER_LISTENER_MODE \
    KSQL_QUERY_PULL_METRICS_ENABLED=$KSQL_QUERY_PULL_METRICS_ENABLED \
    SCHEMA_REGISTRY_MODE=$SCHEMA_REGISTRY_MODE

ENV PATH=${PATH}:${KAFKA_HOME}/bin
USER root
WORKDIR $KAFKA_HOME

RUN set -eux  \
    && apt-get update  \
    && apt-get upgrade -y  \
    && apt-get install -y --no-install-recommends vim jq net-tools curl wget zip unzip openssl ca-certificates  \
    && apt clean  \
    && apt autoremove -y  \
    && apt -f install  \
    && apt-get install -y --no-install-recommends netcat sudo \
    && mkdir -p $KAFKA_HOME  \
    && groupadd --gid $GID $USERNAME \
    && adduser --uid $UID --gid $GID --disabled-password --gecos "" kafka --home $KAFKA_HOME --shell /bin/bash \
    && sudo echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && cp -r /etc/skel/.[^.]* $KAFKA_HOME \
    && mkdir -p $KAFKA_HOME/java \
    && chown -R kafka:kafka /u01 \
    && chmod -R 755  $KAFKA_HOME 

USER kafka
WORKDIR $KAFKA_HOME

ADD --chown=kafka:kafka --chmod=755 https://packages.confluent.io/archive/7.5/confluent-community-7.5.3.tar.gz $KAFKA_HOME
ADD --chown=kafka:kafka --chmod=755 https://download.oracle.com/java/17/archive/jdk-17.0.10_linux-x64_bin.tar.gz $KAFKA_HOME
ADD --chown=kafka:kafka --chmod=755 https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar $KAFKA_HOME/etc/ksqldb/
ADD --chown=kafka:kafka --chmod=755 config/ksql-jmx.yml $KAFKA_HOME/etc/ksqldb/
ADD --chown=kafka:kafka --chmod=755 config/log4j-file-custom.properties $KAFKA_HOME/etc/ksqldb/

RUN mkdir -p $KAFKA_HOME/java && \
    tar -zx -C $KAFKA_HOME/java --strip-components=1 -f jdk-17.0.10_linux-x64_bin.tar.gz && \
    rm -f jdk-17.0.10_linux-x64_bin.tar.gz && \
    tar -zx -C $KAFKA_HOME --strip-components=1 -f confluent-community-7.5.3.tar.gz && \
    rm -rf confluent* && \
    chown -R kafka:kafka $KAFKA_HOME && \
    mkdir -p $KAFKA_HOME/etc/ssl

ADD --chown=kafka:kafka --chmod=755 script/generate_pem_cert.sh $KAFKA_HOME/etc/ssl
ADD --chown=kafka:kafka --chmod=755 script/ca/ $KAFKA_HOME/etc/ssl/

WORKDIR $KAFKA_HOME

ENV PATH="${PATH}:$KAFKA_HOME/java/bin:$KAFKA_HOME/bin" 
ENV JAVA_HOME="$KAFKA_HOME/java"
# ENV CLASSPATH="${CLASSPATH}:$KAFKA_HOME/share/java/kafka-connect-jdbc/*:$KAFKA_HOME/share/java/kafka/*"

WORKDIR $KAFKA_HOME/etc/ssl

RUN chmod u+x $KAFKA_HOME/etc/ssl/generate_pem_cert.sh \    
    && $KAFKA_HOME/etc/ssl/generate_pem_cert.sh  


WORKDIR $KAFKA_HOME
ADD --chown=kafka:kafka --chmod=755 script/start.sh $KAFKA_HOME


CMD ["/bin/bash"]


ENTRYPOINT ["/bin/bash" , "start.sh"]
