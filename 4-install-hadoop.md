# install-hadoop


```SHELL
cd $HOME
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz 
ls -ltr
tar xzf hadoop-3.3.0.tar.gz
rm hadoop-3.3.0.tar.gz
sudo mv -f hadoop-3.3.0 /opt
sudo chown ${USER}:${USER} -R /opt/hadoop-3.3.0
sudo ln -s /opt/hadoop-3.3.0 /opt/hadoop
```
```SHELL
rm /opt/hadoop/etc/hadoop/core-site.xml
vi /opt/hadoop/etc/hadoop/core-site.xml
```

```XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->

<!-- Put site-specific property overrides in this file. -->

<configuration>
 <property>
     <name>fs.defaultFS</name>
     <value>hdfs://localhost:9000</value>
 </property>
</configuration>
```
```SHELL
:wq
```

```SHELL
rm /opt/hadoop/etc/hadoop/hdfs-site.xml
vi /opt/hadoop/etc/hadoop/hdfs-site.xml
```

```XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->

<!-- Put site-specific property overrides in this file. -->

<configuration>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/opt/hadoop/dfs/name</value>
    </property>
    <property>
        <name>dfs.namenode.checkpoint.dir</name>
        <value>/opt/hadoop/dfs/namesecondary</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/opt/hadoop/dfs/data</value>
    </property>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
```

```SHELL
find /usr/lib/jvm -name javac
```

```SHELL
echo $JAVA_HOME
```

```SHELL
cd $HOME
```

```SHELL
vi .profile
```

```SHELL
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
```

```SHELL
:wq
```

```SHELL
source .profile 
```

```SHELL
echo $JAVA_HOME
```

```SHELL
echo $HADOOP_HOME
```

```SHELL
vi /opt/hadoop/etc/hadoop/hadoop-env.sh
```

```SHELL
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
```


```SHELL
hdfs --help
```

```SHELL
hdfs namenode -format
```

```SHELL
echo $PATH
```
```SHELL
ls -ltr /opt/hadoop/bin
```

```SHELL
ls -ltr /opt/hadoop/sbin
```

```SHELL
ls -ltr /opt/hadoop/dfs/
```

```SHELL
ssh ${USER}@localhost
```

```SHELL
exit
```
```SHELL
jps
```

```SHELL
start-dfs.sh
```

```SHELL
jps
```

```SHELL
hdfs dfs -mkdir -p /user/${USER}
hdfs dfs -put /opt/hadoop/etc/hadoop /user/${USER}
hdfs dfs -cat /user/${USER}/hadoop/core-site.xml
hdfs dfs -ls /user/${USER}
hdfs dfs -rm -R -skipTrash /user/${USER}/hadoop
hdfs dfs -ls /user/${USER}
```


```SHELL
rm /opt/hadoop/etc/hadoop/yarn-site.xml
vi /opt/hadoop/etc/hadoop/yarn-site.xml
```


```XML
<?xml version="1.0"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->
<configuration>

<!-- Site specific YARN configuration properties -->
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
    <property>
        <name>yarn.nodemanager.env-whitelist</name>
<value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
    </property>
</configuration>
```


```SHELL
rm /opt/hadoop/etc/hadoop/mapred-site.xml
vi /opt/hadoop/etc/hadoop/mapred-site.xml
```

```XML
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->

<!-- Put site-specific property overrides in this file. -->

<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
    <property>
        <name>mapreduce.application.classpath</name>
        <value>$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/*:$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/lib/*</value>
    </property>
</configuration>
```

```SHELL
start-yarn.sh
```


```SHELL
jps
```

```SHELL
hdfs dfs -ls /user
```
```SHELL
stop-yarn.sh
```
```SHELL
stop-dfs.sh
```

```SHELL
start-dfs.sh
```
```SHELL
start-yarn.sh
```
```SHELL
cd $HOME
```

```SHELL
git clone https://github.com/dgadiraju/retail_db.git
ls -ltr retail_db
sudo rm -rf /data/retail_db
sudo mkdir -p /data/retail_db
ls -ltr /data
sudo cp -rf retail_db/departments /data/retail_db
sudo cp -rf retail_db/categories /data/retail_db
sudo cp -rf retail_db/products /data/retail_db
sudo cp -rf retail_db/orders /data/retail_db
sudo cp -rf retail_db/order_items /data/retail_db
sudo cp -rf retail_db/customers /data/retail_db
```
```SHELL
hdfs dfs -mkdir -p /public
hdfs dfs -put /data/retail_db /public
hdfs dfs -ls /public/retail_db/orders
hdfs dfs -find /public/retail_db
hdfs dfs -cat /public/retail_db/departments/part-00000
```

