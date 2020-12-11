# 准备环境

```
python3 scripts/create_uhost.py --config example/HDFS/hdfs-namenode-cfg.yaml && python3 scripts/create_uhost.py --config example/HDFS/hdfs-datanode-cfg.yaml
ssh root@hdfs-namenode-1 
ssh-keygen 
yum install ansible git python2 -y
ln -sv /usr/bin/python2 /usr/bin/python
git clone  https://github.com/panhaitao/Playbook-Performance-Test.git
创建 inventory/ucloud.ini 配置
ansile-playbook todo/init_common
ssh-copy-id  root@hdfs-namenode-1
ssh-copy-id  root@hdfs-datanode-1
ssh-copy-id  root@hdfs-datanode-2
ssh-copy-id  root@hdfs-datanode-3
```

# 部署集群

```
ssh root@hdfs-namenode-1 
cd Playbook-Performance-Test && ansible-playbook  todo/init_hdfs_hosts -D
```

# 启动集群

```
ssh root@hdfs-namenode-1 'hdfs namenode -format'
ssh root@hdfs-namenode-1 'hdfs --daemon start namenode'
ssh root@hdfs-datanode-1 'hdfs --daemon start datanode'
ssh root@hdfs-datanode-2 'hdfs --daemon start datanode'
ssh root@hdfs-datanode-3 'hdfs --daemon start datanode'
```

# 验证部署

* 验证机架感知: ansible hdfs-namenode-1 -m shell -a 'hdfs  dfsadmin  -printTopology'
* 验证HDFS状态: http://hdfs-namenode-1:9870

# 参考

* https://hadoop.apache.org/docs/r3.3.0/hadoop-project-dist/hadoop-common/SingleCluster.html

# FAQ

`Apache Hadoop: ERROR: Cannot set priority of datanode process` 解决办法: 取消变量 HDFS_DATANODE_SECURE_USER=root
