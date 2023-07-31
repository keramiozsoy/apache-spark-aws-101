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
```SHELL

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
