#!/bin/sh
nohup memtier_benchmark -s 10.10.140.99 -p 6379 -a gogo123 -n 5000000000 -c 80  -d 32 --threads=4 --ratio=5:1 --pipeline=5 &> /tmp/log &
