#!/bin/bash
# 브로커 1대이므로 replication-factor 1. 파티션 6개는 유지해 컨슈머를 최대 6대까지 늘릴 수 있다.
cd "$(dirname "$0")"

for topic in message-relay message-request push-notification; do
  docker compose exec -T kafka kafka-topics.sh --create --if-not-exists \
    --bootstrap-server localhost:9092 \
    --topic "$topic" \
    --partitions 6 \
    --replication-factor 1
done
