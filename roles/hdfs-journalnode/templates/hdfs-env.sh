export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.9.11-2.el8_3.x86_64/
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:/data/hadoop-3.3.0/bin/:/data/hadoop-3.3.0/sbin/
export HADOOP_HOME=/data/hadoop-3.3.0/
