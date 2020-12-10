#!/bin/bash

# UCloud SMC 迁移计划ID
set_id={{ usmc_id }}

# 运行前，先检查是否已经有 agent 已经在运行
COUNT=`ps -ef|grep usmc_client_linux_x86_64|grep setID|grep -v grep|wc -l`
if [[ "$COUNT" > 0 ]]; then
	echo "usmc agent is already running, you must stop it first"
  exit 1
fi

nohup /usmc_client_linux_x86_64 \
    -setID=${set_id} \
    >> usmc_agent_log.txt 2>&1 &

sleep 6s

COUNT=`ps -ef|grep usmc_client_linux_x86_64|grep setID|grep -v grep|wc -l`

if [[ "$COUNT" = 1 ]]; then
	echo "usmc agent started"
else
  echo "usmc agent start failed"
fi
