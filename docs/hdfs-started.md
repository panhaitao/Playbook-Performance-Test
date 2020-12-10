# 部署集群

ssh root@hdfs-namenode-1 
ssh-keygen
yum install ansible git -y
git clone  https://github.com/panhaitao/Playbook-Performance-Test.git
python3 scripts/create_uhost.py --config example/HDFS/hdfs-namenode-cfg.yaml && python3 scripts/create_uhost.py --config example/HDFS/hdfs-datanode-cfg.yaml
cd Playbook-Performance-Test && ansible-playbook  todo/init_hdfs_hosts -D
ssh root@hdfs-datanode-1 
ssh root@hdfs-datanode-1 
ssh root@hdfs-datanode-1 

# 启动集群

ansible hdfs-namenode-1 -m shell -a 'hdfs namenode -format'
ansible hdfs-namenode-1 -m shell -a 'hdfs --daemon start namenode'
ansible hdfs-datanode-1,hdfs-datanode-2,hdfs-datanode-3 -m shell -a 'hdfs --daemon start datanode'

# 验证部署

* 验证机架感知: ansible hdfs-namenode-1 -m shell -a 'hdfs  dfsadmin  -printTopology'
* 验证HDFS状态: http://hdfs-namenode-1:9870
