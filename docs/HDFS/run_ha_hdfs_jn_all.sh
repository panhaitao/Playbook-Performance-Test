ssh hdfs-journalnode-1 'killall java; /data/hadoop-3.3.0/bin/hdfs --daemon start journalnode'
ssh hdfs-journalnode-2 'killall java; /data/hadoop-3.3.0/bin/hdfs --daemon start journalnode'
ssh hdfs-journalnode-3 'killall java; /data/hadoop-3.3.0/bin/hdfs --daemon start journalnode'
