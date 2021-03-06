export HDFS_NAMENODE_USER=hdfs
export HDFS_SECONDARYNAMENODE_USER=hdfs

export JAVA_HOME=/usr/lib/jvm/jre-1.8.0
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:/data/hadoop-3.3.0/bin/:/data/hadoop-3.3.0/sbin/
export HADOOP_HOME=/data/hadoop-3.3.0/
export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true           \
                    -Dsun.security.krb5.debug=true            \
                    -Dsun.security.spnego.debug=true          \
                    -Dsun.security.krb5.disableReferrals=true \
                    -Djava.security.krb5.conf=/etc/krb5.conf  \
                    -Djava.security.krb5.kdc=kdc-master-1.hadoop.com:88  \
                    -Djava.security.krb5.realm=hadoop.com
                    "
