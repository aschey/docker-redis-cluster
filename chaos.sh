#!/bin/bash
while true
do
    pids=$(pgrep -f redis-server)
    num=$((1 + RANDOM % 6))
    nodeId=$(echo $pids | cut -d" " -f${num})
    kill -9 $nodeId
    sleep 10
done