# start-stop-sh

```SHELL
touch stop_all.sh
```

```SHELL
vi stop_all.sh
```

```SHELL
# order of sh commands is important here. Yarn is depended to hdfs.
stop-yarn.sh
stop-dfs.sh
jps
```

```SHELL
source stop_all.sh
```



```SHELL
touch start_all.sh
```

```SHELL
vi start_all.sh
```

```SHELL
start-dfs.sh
start-yarn.sh
docker start cluster_util_db
jps
docker ps
nohup ~/delab-venv/bin/jupyter lab --ip 0.0.0.0. &
```

```SHELL
source start_all.sh
```
