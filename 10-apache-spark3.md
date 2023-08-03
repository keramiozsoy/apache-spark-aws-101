# install apache spark3

```SHELL
wget https://ftp.wayne.edu/apache/spark/spark-3.1.1/spark-3.1.1-bin-hadoop3.2.tgz
tar xzf spark-3.1.1-bin-hadoop3.2.tgz
rm spark-3.1.1-bin-hadoop3.2.tgz
sudo mv -f spark-3.1.1-bin-hadoop3.2 /opt
sudo ln -s spark-3.1.1-bin-hadoop3.2 /opt/spark3
```

```SHELL
vi /opt/spark3/conf/spark-env.sh
```

```SHELL
export HADOOP_HOME="/opt/hadoop"
export HADOOP_CONF_DIR="/opt/hadoop/etc/hadoop"
```

```SHELL
vi /opt/spark3/conf/spark-defaults.conf 
```

```SHELL
spark.driver.extraJavaOptions     -Dderby.system.home=/tmp/derby/
spark.sql.repl.eagerEval.enabled  true
spark.master                      yarn
spark.eventLog.enabled            true
spark.eventLog.dir                hdfs:///spark3-logs
spark.history.provider            org.apache.spark.deploy.history.FsHistoryProvider
spark.history.fs.logDirectory     hdfs:///spark3-logs
spark.history.fs.update.interval  10s
spark.history.ui.port             18080
spark.yarn.historyServer.address  localhost:18080
spark.yarn.jars                   hdfs:///spark3-jars/*.jar
```

```SHELL
vi /opt/hive/conf/hive-site.xml
```

```SHELL
<property>
    <name>hive.metastore.schema.verification</name>
    <value>false</value>
  </property>
```

```SHELL
hdfs dfs -mkdir /spark3-jars
hdfs dfs -mkdir /spark3-logs
 
hdfs dfs -put /opt/spark3/jars/* /spark3-jars
```


```SHELL
sudo ln -s /opt/hive/conf/hive-site.xml /opt/spark3/conf/
sudo wget https://jdbc.postgresql.org/download/postgresql-42.2.19.jar -O /opt/spark3/jars/postgresql-42.2.19.jar
```
