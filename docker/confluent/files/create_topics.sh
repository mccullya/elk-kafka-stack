#!/usr/bin/env bash
echo Waiting for Kafka to be ready
cub kafka-ready -b kafka:9092 1 20
kafka-topics --create --topic home-office-dummy-topic --if-not-exists --zookeeper zookeeper:2181 --partitions 1 --replication-factor 1
seq 42 | kafka-console-producer --request-required-acks 1 --broker-list kafka:9092 --topic home-office-dummy-topic && echo 'Produced 42 messages.'
