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
    -e POSTGRES_HOST_AUTH_METHOD=md5 \
    postgres
```

```SHELL
docker start cluster_util_db
```

```SHELL
docker logs -f cluster_util_db
```

```SHELL
 docker exec -it -u postgres cluster_util_db \
 	bash -c "echo 'password_encryption=md5' >> /var/lib/postgresql/data/postgresql.conf"
```

```SHELL
 docker restart cluster_util_db
```

```SHELL
docker exec \
    -it cluster_util_db \
    psql -U postgres
```

```SHELL

#itversity > md5 generate > 6d02743f4d0b67598b73f84c68b2c938

alter role postgres with password '6d02743f4d0b67598b73f84c68b2c938';
```

```SHELL
CREATE DATABASE metastore;
CREATE USER hive WITH PASSWORD '6d02743f4d0b67598b73f84c68b2c938';
ALTER USER hive WITH SUPERUSER;

# LIST OF USEFULL COMMANDS
# 1. Grant CONNECT to the database:
# GRANT CONNECT ON DATABASE database_name TO username;
# 2. Grant USAGE on schema:
# GRANT USAGE ON SCHEMA schema_name TO username;
# 3. Grant on all tables for DML statements: SELECT, INSERT, UPDATE, DELETE:
# GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA schema_name TO username;
# 4. Grant all privileges on all tables in the schema:
# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema_name TO username;
# 5. Grant all privileges on all sequences in the schema:
# GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA schema_name TO username;
# 6. Grant all privileges on the database:
# GRANT ALL PRIVILEGES ON DATABASE database_name TO username;
# 7. Grant permission to create database:
# ALTER USER username CREATEDB;
# 8. Make a user superuser:
# ALTER USER myuser WITH SUPERUSER;
# 9.Remove superuser status:
# ALTER USER username WITH NOSUPERUSER;
```


```SHELL
exit
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

6d02743f4d0b67598b73f84c68b2c938

\q
```

```SHELL
cd $HOME
```
```SHELL
vi .profile
```

```SHELL
export HIVE_HOME=/opt/hive
export PATH=$PATH:${HIVE_HOME}/bin
```

```SHELL
source .profile
```

```SHELL
rm /opt/hive/conf/hive-site.xml
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
    <value>6d02743f4d0b67598b73f84c68b2c938</value>
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

# output
# beeline> Initialization script completed
# schemaTool completed
```


```SHELL
docker exec \
    -it cluster_util_db \
    psql -U postgres \
    -d metastore
```

```SHELL
\d
```
```SHELL

metastore=# \d
                     List of relations
 Schema |             Name              |   Type   | Owner 
--------+-------------------------------+----------+-------
 public | BUCKETING_COLS                | table    | hive
 public | CDS                           | table    | hive
 public | COLUMNS_V2                    | table    | hive
 public | CTLGS                         | table    | hive
 public | DATABASE_PARAMS               | table    | hive
 public | DBS                           | table    | hive
 public | DB_PRIVS                      | table    | hive
 public | DELEGATION_TOKENS             | table    | hive
 public | FUNCS                         | table    | hive
 public | FUNC_RU                       | table    | hive
 public | GLOBAL_PRIVS                  | table    | hive
 public | IDXS                          | table    | hive
 public | INDEX_PARAMS                  | table    | hive
 public | I_SCHEMA                      | table    | hive
 public | KEY_CONSTRAINTS               | table    | hive
 public | MASTER_KEYS                   | table    | hive
 public | MASTER_KEYS_KEY_ID_seq        | sequence | hive
 public | METASTORE_DB_PROPERTIES       | table    | hive
 public | MV_CREATION_METADATA          | table    | hive
 public | MV_TABLES_USED                | table    | hive
 public | NOTIFICATION_LOG              | table    | hive
 public | NOTIFICATION_SEQUENCE         | table    | hive
 public | NUCLEUS_TABLES                | table    | hive
 public | PARTITIONS                    | table    | hive
 public | PARTITION_EVENTS              | table    | hive
 public | PARTITION_KEYS                | table    | hive
 public | PARTITION_KEY_VALS            | table    | hive
 public | PARTITION_PARAMS              | table    | hive
 public | PART_COL_PRIVS                | table    | hive
 public | PART_COL_STATS                | table    | hive
 public | PART_PRIVS                    | table    | hive
 public | ROLES                         | table    | hive
 public | ROLE_MAP                      | table    | hive
 public | SCHEMA_VERSION                | table    | hive
 public | SDS                           | table    | hive
 public | SD_PARAMS                     | table    | hive
 public | SEQUENCE_TABLE                | table    | hive
 public | SERDES                        | table    | hive
 public | SERDE_PARAMS                  | table    | hive
 public | SKEWED_COL_NAMES              | table    | hive
 public | SKEWED_COL_VALUE_LOC_MAP      | table    | hive
 public | SKEWED_STRING_LIST            | table    | hive
 public | SKEWED_STRING_LIST_VALUES     | table    | hive
 public | SKEWED_VALUES                 | table    | hive
 public | SORT_COLS                     | table    | hive
 public | TABLE_PARAMS                  | table    | hive
 public | TAB_COL_STATS                 | table    | hive
 public | TBLS                          | table    | hive
 public | TBL_COL_PRIVS                 | table    | hive
 public | TBL_PRIVS                     | table    | hive
 public | TYPES                         | table    | hive
 public | TYPE_FIELDS                   | table    | hive
 public | VERSION                       | table    | hive
 public | WM_MAPPING                    | table    | hive
 public | WM_POOL                       | table    | hive
 public | WM_POOL_TO_TRIGGER            | table    | hive
 public | WM_RESOURCEPLAN               | table    | hive
 public | WM_TRIGGER                    | table    | hive
 public | aux_table                     | table    | hive
 public | compaction_queue              | table    | hive
 public | completed_compactions         | table    | hive
 public | completed_txn_components      | table    | hive
 public | hive_locks                    | table    | hive
 public | materialization_rebuild_locks | table    | hive
 public | min_history_level             | table    | hive
 public | next_compaction_queue_id      | table    | hive
 public | next_lock_id                  | table    | hive
 public | next_txn_id                   | table    | hive
 public | next_write_id                 | table    | hive
 public | repl_txn_map                  | table    | hive
 public | runtime_stats                 | table    | hive
 public | txn_components                | table    | hive
 public | txn_to_write_id               | table    | hive
 public | txns                          | table    | hive
 public | write_set                     | table    | hive
(75 rows)
```
