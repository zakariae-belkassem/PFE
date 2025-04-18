FROM bde2020/spark-master:latest

RUN wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && \
    tar xvf spark-3.5.5-bin-hadoop3.tgz && \
    mv spark-3.5.5-bin-hadoop3 /opt/spark && \
    echo "export PATH=\$PATH:/opt/spark/bin" >> ~/.bashrc

ENV PATH="/opt/spark/bin:${PATH}"
    
RUN apk update && \
    apk add --no-cache openjdk11 curl

# Set JAVA_HOME (Alpine stores JDKs in /usr/lib/jvm)
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

# Download PostgreSQL JDBC driver (you can change version if needed)
RUN wget https://jdbc.postgresql.org/download/postgresql-42.7.5.jar &&\
    mv postgresql-42.7.5.jar /opt/spark/jars/

RUN /bin/bash -c "source ~/.bashrc"
