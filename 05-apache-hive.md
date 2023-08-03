# install-apache-hive

```SHELL
cd $HOME
wget https://archive.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
ls -ltr
tar xzf apache-hive-3.1.2-bin.tar.gz
rm apache-hive-3.1.2-bin.tar.gz
sudo mv -f apache-hive-3.1.2-bin /opt
sudo chown ${USER}:${USER} -R /opt/apache-hive-3.1.2-bin
sudo ln -s /opt/apache-hive-3.1.2-bin /opt/hive
```
