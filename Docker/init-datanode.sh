#!/bin/bash
mkdir -p /hadoop/dfs/data
chown -R root:root /hadoop/dfs/data  # or whatever user is running it
chmod 700 /hadoop/dfs/data

rm -rf /opt/hadoop/data/dataNode/*
chown -R hadoop:hadoop /opt/hadoop/data/dataNode
chmod 755 /opt/hadoop/data/dataNode
hdfs datanode