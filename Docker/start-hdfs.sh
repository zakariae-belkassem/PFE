#!/bin/bash
mkdir -p /hadoop/dfs/name
if [ ! -d "/opt/hadoop/data/nameNode/current" ]; then
    echo "Formatting NameNode..."
    hdfs namenode -format
fi
hdfs namenode