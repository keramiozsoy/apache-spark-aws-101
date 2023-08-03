# install apache spark with yarn mode

```SHELL
cd $HOME
```
```SHELL
wget https://downloads.apache.org/spark/spark-2.4.7/spark-2.4.7-bin-hadoop2.7.tgz
```
```SHELL
tar xzf spark-2.4.7-bin-hadoop2.7.tgz
```
```SHELL
rm spark-2.4.7-bin-hadoop2.7.tgz
```
```SHELL
sudo mv -f spark-2.4.7-bin-hadoop2.7 /opt
```
```SHELL
sudo ln -s spark-2.4.7-bin-hadoop2.7 /opt/spark2
```

```SHELL
ls -ltr /opt/spark2/bin
```

```SHELL
vi /opt/spark2/conf/spark-env.sh
```

```SHELL
export HADOOP_HOME="/opt/hadoop"
export HADOOP_CONF_DIR="/opt/hadoop/etc/hadoop"
export SPARK_DIST_CLASSPATH=$(hadoop --config ${HADOOP_CONF_DIR} classpath)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native
```

```SHELL
 vi /opt/spark2/conf/spark-defaults.conf
```

```SHELL
spark.driver.extraJavaOptions -Dderby.system.home=/tmp/derby/
spark.sql.repl.eagerEval.enabled   true
spark.master    yarn
spark.eventLog.enabled true
spark.eventLog.dir               hdfs:///spark2-logs
spark.history.provider            org.apache.spark.deploy.history.FsHistoryProvider
spark.history.fs.logDirectory     hdfs:///spark2-logs
spark.history.fs.update.interval  10s
spark.history.ui.port             18081
spark.yarn.historyServer.address localhost:18081
spark.yarn.jars hdfs:///spark2-jars/*.jar
```

- We also need to create directories for logs and jars in HDFS. Also, Spark jars should be copied to HDFS folder provided as part of spark.yarn.jars

```SHELL
hdfs dfs -mkdir /spark2-jars
hdfs dfs -mkdir /spark2-logs
 
hdfs dfs -put /opt/spark2/jars/* /spark2-jars
```
- By default we will not be able to access Hive Metastore tables and databases using Spark.
- We need to perform below steps to integrate Spark with Hive Metastore.

```SHELL
sudo ln -s /opt/hive/conf/hive-site.xml /opt/spark2/conf/

sudo wget https://jdbc.postgresql.org/download/postgresql-42.2.19.jar -O /opt/spark2/jars/postgresql-42.2.19.jar
```
