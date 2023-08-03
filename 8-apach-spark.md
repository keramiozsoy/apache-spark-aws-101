# install apache spark

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
