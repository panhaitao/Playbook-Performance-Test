root@hdfs-namenode-2 'killall java'
root@hdfs-namenode-2 'hdfs namenode -bootstrapstandby'
root@hdfs-namenode-2 'hdfs --daemon start namenode'
root@hdfs-namenode-2 'hdfs --daemon start zkfc'
