export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root

export JAVA_HOME=/usr/lib/jvm/jre-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:/data/hadoop-3.3.0/bin/:/data/hadoop-3.3.0/sbin/
export HADOOP_HOME=/data/hadoop-3.3.0/
