#!/bin/sh
export JAVA_HOME=/home/jdk1.8.0_231
nohup /home/apache-jmeter-5.2.1/bin/jmeter -n -t /tmp/post.jmx -l /data/result/result.jtl -e -o /data/result -R jmeter-1,jmeter-2,jmeter-3,jmeter-4,jmeter-5 &> /tmp/http_bench.log &
