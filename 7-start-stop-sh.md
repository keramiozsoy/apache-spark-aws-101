# start-stop-sh

```SHELL
touch stop_all.sh
```

```SHELL
vi stop_all.sh
```

```SHELL
# ORDER IMPORTANT
stop-yarn.sh
stop-dfs.sh
jps
```


```SHELL
touch start_all.sh
```

```SHELL
start-dfs.sh
start-yarn.sh
docker start cluster_util_db
jps
docker ps
```
