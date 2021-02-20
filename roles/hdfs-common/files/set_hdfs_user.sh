#!/bin/bash
groupdel hadoop &>/dev/null || true
userdel -r hdfs &> /dev/null || true
groupadd -g 1001 hadoop
useradd -d /home/hdfs -g 1001 -M -s "/bin/bash" -u 1001 hdfs
mkdir -pv /home/hdfs && chown hdfs:hadoop /home/hdfs/
echo "hdfs:hdfs" | chpasswd
