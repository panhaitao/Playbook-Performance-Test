#!/bin/sh
list=$1
rule=$2

cat $list | grep $rule | awk '{print $2}'
