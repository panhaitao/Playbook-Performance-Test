## 准备一台运行ansible的主机

* 安装软件包 yum install ansible git -y
* git clone https://github.com/panhaitao/Playbook-Performance-Test.git
* cd Playbook-Performance-Test

创建 inventory/ucloud.ini 文件，写入如下字段：
```
[ucloud]
public_key = ucloud_PublicKey
private_key = ucloud_PrivateKey
base_url = http://api.ucloud.cn/
region = cn-bj2

[cache]
path = tmp/cache/ansible-ucloud.cache
max_age = 86400

[uhost]
group = all
tag = %(Tag)s
name = %(PrivateIP)s
host = %(PrivateIP)s
ssh_port = 22
ssh_password = 主机密码
winrm_port = 5985
winrm_password = PWxxxxx
```

## 测试ansible和其他主机ssh登陆是否正常

* cd Playbook-Performance-Test &&  ansible all -m shell -a 'pwd'

## 安装监控agent

* cd Playbook-Performance-Test &&  ansible-playbook tasks/install_uma_agent.yaml -e group=all
