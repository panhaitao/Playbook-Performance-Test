#!/bin/bash

action=ListUDTSTask
limit=3
offset=0
projectid=
type=integration
publickey=
privatekey=

########## 根据传参执行操作#########

signature=`echo -n "Action${action}Limit${limit}Offset${offset}ProjectId${projectid}PublicKey${publickey}Type${type}$privatekey" | shasum | awk '{print $1}' `
echo $signature

curl "https://api.ucloud.cn/?Action=$action&Limit=${limit}&Offset=${offset}&ProjectId=${projectid}&PublicKey=${publickey}&Type=${type}&Signature=${signature}"
