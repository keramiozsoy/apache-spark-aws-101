# apache-hive-metastore.md

```SHELL
id ${USER}
```
```SHELL
sudo usermod -aG docker ${USER}
```

```SHELL
docker pull postgres
```
```SHELL
docker create \
    --name cluster_util_db \
    -p 6432:5432 \
    -e POSTGRES_PASSWORD=itversity \
    postgres
```

```SHELL
docker start cluster_util_db
```

```SHELL
docker logs -f cluster_util_db
```

```SHELL
docker exec \
    -it cluster_util_db \
    psql -U postgres
```

```SHELL
CREATE DATABASE metastore;
CREATE USER hive WITH ENCRYPTED PASSWORD 'itversity';
GRANT ALL ON DATABASE metastore TO hive;
```

```SHELL
sudo apt install postgresql-client -y
```
```SHELL
telnet localhost 6432
```
```SHELL
psql -h localhost \
    -p 6432 \
    -d metastore \
    -U hive \
    -W

itversity

\q
```

```SHELL
cd $HOME
```
```SHELL
vi .profile
```

```SHELL
$ export HIVE_HOME=/opt/hive
$ export PATH=$PATH:${HIVE_HOME}/bin
```
```SHELL
source .profile
```

```SHELL
vi /opt/hive/conf/hive-site.xml
```

```XML
<configuration>
  <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:postgresql://localhost:6432/metastore</value>
    <description>PostgreSQL JDBC driver connection URL</description>
  </property>
 
  <property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>org.postgresql.Driver</value>
    <description>PostgreSQL metastore driver class name</description>
  </property>
 
  <property>
    <name>javax.jdo.option.ConnectionUserName</name>
    <value>hive</value>
    <description>the username for the DB instance</description>
  </property>
 
  <property>
    <name>javax.jdo.option.ConnectionPassword</name>
    <value>itversity</value>
    <description>the password for the DB instance</description>
  </property>
</configuration>
```


```SHELL
rm /opt/hive/lib/guava-19.0.jar
```

```SHELL
cp /opt/hadoop/share/hadoop/hdfs/lib/guava-27.0-jre.jar /opt/hive/lib/
```

```SHELL
hive
```

```SHELL
exit
```

```SHELL
schematool -dbType postgres -initSchema
```
