# -*- coding: utf-8 -*-

"""
    Homepage: https://github.com/ucloud/ucloud-sdk-python3
    Examples: https://github.com/ucloud/ucloud-sdk-python3/tree/master/examples
    Documentation: https://ucloud.github.io/ucloud-sdk-python3/
"""

import os
import yaml
import argparse

from ucloud.core import exc
from ucloud.client import Client

def yaml_loader(file_path):
    with open(file_path, "r") as file_descriptor:
        return yaml.safe_load(file_descriptor)

parser = argparse.ArgumentParser()
parser.add_argument(
    "--config",
    nargs="?",
    type=str,
    default="/etc/uhost.yml",
    help="The config for create cloud hosts(default is /etc/uhost.yml)",
)

def create_hosts(hostname, cfg):
    client = Client({
        "region": cfg['rz']['region'],
        "project_id": cfg['rz']['project_id'],
        "public_key": cfg['auth']['public_key'],
        "private_key": cfg['auth']['private_key'],
        "base_url": "https://api.ucloud.cn",
    })

    try:
        resp = client.uhost().create_uhost_instance({
            "MachineType": cfg['os']['type'],
            "ChargeType": "Dynamic", 
            "SecurityGroupId": cfg['rz']['securitygroupid'],
            "Zone": cfg['rz']['zone'],
            "ImageId": cfg['os']['imageid'],
            "Password": cfg['os']['password'],
            "LoginMode": "Password",
            "Name": hostname,
            "CPU": cfg['os']['cpu'],
            "Memory": cfg['os']['mem'],
            "MaxCount": 1,
            "NetCapability": cfg['os']['net_capability'],
            "Tag": cfg['tag'],
            "NetworkInterface": [
                {
                    "EIP": {
                        "Bandwidth": 300,
                        "PayMode": "Traffic",
                        "OperatorName": "Bgp"
                    }
                }
            ],
            "Disks": [
                {
                    "Type": cfg['disk'][0]['type'],
                    "IsBoot": "True",
                    "Size": cfg['disk'][0]['size']
                },
                {
                    "Type": cfg['disk'][1]['type'],
                    "IsBoot": "false",
                    "Size": cfg['disk'][1]['size']
                }
            ]
        
        })
    except exc.UCloudException as e:
        print(e)
    else:
        print(resp['IPs'][0])

if __name__ == '__main__':
    args = parser.parse_args()
    cfg = yaml_loader(args.config)
    if cfg['inventory']['maxhosts'] == 1:
        hostname = cfg['os']['hostname_pre']+'-1'
        print(hostname)
        create_hosts(hostname, cfg)
    else:
        for num in range(cfg['inventory']['maxhosts']):
            hostname = cfg['os']['hostname_pre']+'-'+str(num+1)
            print(hostname)
            create_hosts(hostname, cfg)
