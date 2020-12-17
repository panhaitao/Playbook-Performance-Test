ssh root@hdfs-datanode-1 'killall java; hdfs --daemon start datanode'
ssh root@hdfs-datanode-2 'killall java; hdfs --daemon start datanode'
ssh root@hdfs-datanode-3 'killall jaca; hdfs --daemon start datanode'
ssh root@hdfs-datanode-4 'killall java; hdfs --daemon start datanode'
