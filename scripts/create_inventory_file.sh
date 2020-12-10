#!/bin/bash

function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

function check_args()
{
  local argname=$1
  local arg=$2
  if [[ "$arg" == "" ]];then
    echo "the arg value $argname is empty!!!"
    exit 1
  fi
}

function gen_inventory_file()
{

local inventory_name=$1 && check_args "inventory_name" $inventory_name
local group_name=$2     && check_args "group_name" $group_name
local root_pw=$3        && check_args "root_password" $root_pw
local max_num=$4        && check_args "max_num" $max_num
local config=$5         && check_args "config" $config

mkdir -pv hosts

cat > hosts/$inventory_name <<EOF  
[$group_name]
EOF

for N in `seq 1 $max_num`
do
  name=$inventory_name-$N
  ip=`python3  scripts/create_uhost.py --config $config`

cat >> hosts/$inventory_name <<EOF  
$name			ansible_ssh_host=$ip
EOF
  sleep 1
done

cat >> hosts/$inventory_name <<EOF  
[ops]
ops                     ansible_ssh_host=127.0.0.1

[all:vars]
ansible_connection=ssh
ansible_ssh_user=root
ansible_ssh_pass="$root_pw"
EOF

}

export config=$1  && check_args "yaml config" $config

if [ -e $config_file ]; then
    eval $(parse_yaml $config "conf_")
    h_name=$conf_inventory_name
    g_name=$conf_inventory_group
    pw=$conf_os_password
    num=$conf_inventory_maxhosts
    gen_inventory_file  $h_name $g_name $pw $num $config
else
    echo "the yaml config don't exist!!!"
fi
