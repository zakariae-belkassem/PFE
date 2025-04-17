#FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8


# # Allow buildtime config of HIVE_VERSION and SPARK_VERSION
# ARG HIVE_VERSION
# ARG SPARK_VERSION=2.4.5

# ENV HIVE_VERSION=${HIVE_VERSION:-2.3.2}
# ENV SPARK_VERSION=${SPARK_VERSION}
# ENV HIVE_HOME=/opt/hive
# ENV SPARK_HOME=/opt/spark
# ENV PATH=$HIVE_HOME/bin:$SPARK_HOME/bin:$PATH
# ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION

# #WORKDIR /opt
# RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
# 	sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
#     echo "Acquire::Check-Valid-Until false;" >> /etc/apt/apt.conf.d/99no-check-valid-until

# # Install Hive and PostgreSQL JDBC
# RUN apt-get update && apt-get install -y wget procps && \
#     wget https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
#     tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
#     mv apache-hive-$HIVE_VERSION-bin hive && \
#     wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar && \
#     rm apache-hive-$HIVE_VERSION-bin.tar.gz && \
#     apt-get --purge remove -y wget && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# # Install Spark
# RUN wget https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz && \
#     tar -xzvf spark-$SPARK_VERSION-bin-hadoop2.7.tgz && \
#     mv spark-$SPARK_VERSION-bin-hadoop2.7 spark && \
#     rm spark-$SPARK_VERSION-bin-hadoop2.7.tgz
# # RUN apt-get install wget
# # RUN wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && tar xvf spark-3.5.5-bin-hadoop3.tgz && mv spark-3.5.5-bin-hadoop3 spark 
# # Add Hive configuration files
# ADD conf/hive-site.xml $HIVE_HOME/conf
# ADD conf/beeline-log4j2.properties $HIVE_HOME/conf
# ADD conf/hive-env.sh $HIVE_HOME/conf
# ADD conf/hive-exec-log4j2.properties $HIVE_HOME/conf
# ADD conf/hive-log4j2.properties $HIVE_HOME/conf
# ADD conf/ivysettings.xml $HIVE_HOME/conf
# ADD conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

# # Add startup scripts
# COPY startup.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/startup.sh

# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh

# # Expose ports
# EXPOSE 10000
# EXPOSE 10002
# EXPOSE 7077
# EXPOSE 8080

# ENTRYPOINT ["entrypoint.sh"]
# CMD ["startup.sh"]

FROM bde2020/spark-master:latest

RUN wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && \
    tar xvf spark-3.5.5-bin-hadoop3.tgz && \
    mv spark-3.5.5-bin-hadoop3 /opt/spark && \
    echo "export PATH=\$PATH:/opt/spark/bin" >> ~/.bashrc

ENV PATH="/opt/spark/bin:${PATH}"

RUN /bin/bash -c "source ~/.bashrc"
