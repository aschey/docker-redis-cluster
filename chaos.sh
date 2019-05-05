#!/bin/bash
while true
do
    pids=$(pgrep 'redis-server|redis-sentinel')
    pidCount=$(pgrep 'redis-server|redis-sentinel' | wc -l)
    num=$((1 + RANDOM % $pidCount))
    nodeId=$(echo $pids | cut -d" " -f${num})
    echo "killing pid $nodeId name: $(ps -p $nodeId -o comm=)"
    kill -9 $nodeId
    sleep 1
done