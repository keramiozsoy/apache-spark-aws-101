#!/bin/sh

wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz 
ls -ltr
tar xzf hadoop-3.3.0.tar.gz
rm hadoop-3.3.0.tar.gz
sudo mv -f hadoop-3.3.0 /opt
sudo chown ${USER}:${USER} -R /opt/hadoop-3.3.0
sudo ln -s /opt/hadoop-3.3.0 /opt/hadoop
