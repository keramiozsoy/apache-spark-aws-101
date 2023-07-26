# apache-spark-cloud-101




1 - Create Aws Acount


2 - AWS Cloud9
- Search on the bar 
- Create Environment
- Name : delabdemo
- Environment Type  : new e2c instance
- Instance Type  : t3.medium ( 4 GiB RAM  + 2 vCPU )
- Platform : Ubuntu Server 18.04 LTS
- Timeout  : 30 minutes
- Press Create and wait to compleate process.
- Click and open Cloud9 IDE.


3 - EC2 Instance
- Search on the bar
- Click on running EC2 instance
- You will see the ec2 instance. We have just created previous step with AWS Cloud9
- Find, Copy -> Public IPv4 DNS -> and paste to the browser.
- It will not work.



4 - Open terminal on AWS Cloud9
- whenever you provisioned an instance on aws, you will be getting The Apache HTTP Server up and running.


```SHELL
$ sudo systemctl status apache2
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
  Drop-In: /lib/systemd/system/apache2.service.d
           └─apache2-systemd.conf
   Active: active (running) since Wed 2023-07-26 16:21:52 UTC; 17min ago
  Process: 872 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
 Main PID: 996 (apache2)
    Tasks: 6 (limit: 4612)
   CGroup: /system.slice/apache2.service
           ├─ 996 /usr/sbin/apache2 -k start
           ├─1006 /usr/sbin/apache2 -k start
           ├─1007 /usr/sbin/apache2 -k start
           ├─1008 /usr/sbin/apache2 -k start
           ├─1009 /usr/sbin/apache2 -k start
           └─1010 /usr/sbin/apache2 -k start

$ telnet localhost 80
Trying 127.0.0.1...
Connected to localhost.
```

- It will not work. The reason is the por is not opened as part of the security group.
- Search on the bar
- Click on running EC2 instance
- Click Security Tab -> Click Security Groups
- Security Group is firewall within the system.
- Find Inbound Rules
- Edit Inbound Rules
- Add Rule
- Type : HTTP
- Source: My IP ( it means, It will get your IP address, and it will connect only you.)
- Save Rule.
- Click on running EC2 instance
- Find, Copy -> Public IPv4 DNS -> and paste to the browser.
- it works :) ( you will see Apache2 Default Page)

- We are able to access the page until the instance shutown. Because the IP will change.
- If we don't want to face this issue, we can create Elastic IP.

4 - EC2 Instance
- Search on the bar
- Click on running EC2 instance
- Click Instance State and Stop Instance on top of page.
- The instance will start automatically, because of Cloud9 is already active.
- Lets check the ip and public IPv4 DNS are complately different.
- It is hard to use Public IPv4 DNS as each time different address.

5 - EC2 Instance
- Search on the bar
- Elastic IP Address
- Allocate.
- Edit Name : delabdemo
- Click Actions > Associate Elastic IP Address.
- Click the running instance.
- Associate.
- Now, Public IPv4 DNS will not be change.
- Click the running instance. Try to reboot instance. You will use same Public IPv4 DNS

6 - AWS Cloud9
- Search on the bar 
- open terminal

```SHELL
$ df -h
Filesystem       Size  Used Avail Use% Mounted on
udev             1.9G     0  1.9G   0% /dev
tmpfs            388M  824K  387M   1% /run
/dev/nvme0n1p1   9.6G  5.6G  4.0G  59% /
tmpfs            1.9G     0  1.9G   0% /dev/shm
tmpfs            5.0M     0  5.0M   0% /run/lock
tmpfs            1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/loop0        25M   25M     0 100% /snap/amazon-ssm-agent/6563
/dev/loop2        56M   56M     0 100% /snap/core18/2785
/dev/loop1        54M   54M     0 100% /snap/snapd/19457
/dev/nvme0n1p15  105M  5.3M  100M   5% /boot/efi
tmpfs            388M     0  388M   0% /run/user/1000
```

- Look at / (root) 
- we would like to increase storage, we are able to use Amazon EBS storage.
- Go to EC2 Instance
- Click running instance
- Click section Storage
- Click Block Devices
- Click Volume (10 GB)
- Edit name exising volume as
- Click Actions -> Modify Volume
- Increase size from 10 GiB to 32 Gib.
- Modify.
- Refresh Page and see 32 GiB.
- The volume is increased but Cloud9 will not affected yet.
- Go to EC2 Instance
- Click running instance
- Click Instance Stat -> Reboot Instance
- Look at / (root)
- :)
  
```SHELL
$ df -h
Filesystem       Size  Used Avail Use% Mounted on
udev             1.9G     0  1.9G   0% /dev
tmpfs            388M  824K  387M   1% /run
/dev/nvme0n1p1    31G  5.6G   26G  19% /
tmpfs            1.9G     0  1.9G   0% /dev/shm
tmpfs            5.0M     0  5.0M   0% /run/lock
tmpfs            1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/loop0        25M   25M     0 100% /snap/amazon-ssm-agent/6563
/dev/loop2        54M   54M     0 100% /snap/snapd/19457
/dev/loop1        56M   56M     0 100% /snap/core18/2785
/dev/nvme0n1p15  105M  5.3M  100M   5% /boot/efi
tmpfs            388M     0  388M   0% /run/user/1000
```

7 - Setup Jupyter Lab on Cloud9
- Cloud 9
- Search on the bar
- open terminal

```SHELL
python3
```
run to exit below command
```SHELL
exit()
```

```SHELL
$ mkdir delab
$ cd delab
```


```SHELL
$ python3 -m venv delab-venv
$ find delab-venv/


$ find delab-venv/
delab-venv/
delab-venv/bin
delab-venv/bin/pip3
delab-venv/bin/pip
delab-venv/bin/easy_install
delab-venv/bin/pip3.6
delab-venv/bin/activate
...

```

```SHELL
$ ls -ltr delab-venv/bin
total 32
lrwxrwxrwx 1 ubuntu ubuntu   16 Jul 26 17:49 python3 -> /usr/bin/python3
lrwxrwxrwx 1 ubuntu ubuntu    7 Jul 26 17:49 python -> python3
-rwxrwxr-x 1 ubuntu ubuntu  271 Jul 26 17:49 easy_install-3.6
-rwxrwxr-x 1 ubuntu ubuntu  271 Jul 26 17:49 easy_install
-rwxrwxr-x 1 ubuntu ubuntu  243 Jul 26 17:49 pip3.6
-rwxrwxr-x 1 ubuntu ubuntu  243 Jul 26 17:49 pip3
-rwxrwxr-x 1 ubuntu ubuntu  243 Jul 26 17:49 pip
-rw-r--r-- 1 ubuntu ubuntu 2449 Jul 26 17:49 activate.fish
-rw-r--r-- 1 ubuntu ubuntu 1285 Jul 26 17:49 activate.csh
-rw-r--r-- 1 ubuntu ubuntu 2229 Jul 26 17:49 activate
```

Let's activate python env.

```SHELL
$ source delab-venv/bin/activate
```
Let's install jupyterlab

```SHELL
$ python -m pip install --upgrade pip
$ pip install jupyterlab
```


```SHELL
$ jupyter lab --ip 0.0.0.0

[I 2023-07-26 17:59:54.819 ServerApp] jupyterlab | extension was successfully linked.
[I 2023-07-26 17:59:54.828 ServerApp] Writing Jupyter server cookie secret to /home/ubuntu/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2023-07-26 17:59:55.090 ServerApp] nbclassic | extension was successfully linked.
[I 2023-07-26 17:59:55.115 ServerApp] nbclassic | extension was successfully loaded.
[I 2023-07-26 17:59:55.116 LabApp] JupyterLab extension loaded from /home/ubuntu/environment/delab/delab-venv/lib/python3.6/site-packages/jupyterlab
[I 2023-07-26 17:59:55.116 LabApp] JupyterLab application directory is /home/ubuntu/environment/delab/delab-venv/share/jupyter/lab
[I 2023-07-26 17:59:55.120 ServerApp] jupyterlab | extension was successfully loaded.
[I 2023-07-26 17:59:55.121 ServerApp] Serving notebooks from local directory: /home/ubuntu/environment/delab
[I 2023-07-26 17:59:55.121 ServerApp] Jupyter Server 1.13.1 is running at:
http://127.0.0.1:8888/lab?token=2614abe261cd501fa56acdcac10e86b1c943c00a59b89d013
```

- Port seems like 8888
- Token will be use when jupyter is up and running first time.
- Open Cloud9 new terminal.

```SHELL
$ telnet localhost 8888
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
```

- We have to go running e2c instance and click, and go to Security Tab, click Security Group
- Review Inbound Rules
- Find Inbound Rules
- Edit Inbound Rules
- Add Rule
- Type : Custom TCP
- Port : 8888
- Source: My IP ( it means, It will get your IP address, and it will connect only you.)
- Save Rule.
- Click on running EC2 instance
- Find, Copy -> Public IPv4 DNS -> and paste to the browser. Add :8888 port end of DNS


- Now we can see the jupyter.
- Paste token and login.
- Now you can use juphyter lab.

8 - Click Notebook Pyhon3

Write and hit ctrl + enter

```python
print('hello world')
```

hello world

```python
from platform import python_version
python_version()
```


- Go to E2C instance terminal
- Ctrl  C to exit

9 - Jupyter Lab running on background.

If you would like to run Jupyter Lab as a background process 

```SHELL
$ nohup jupyter lab --ip 0.0.0.0 &
```

Let's see token 

```SHELL
$ tail nohup.out
or
$ view nohup.out 
``` 

Close Jupyter Lab

```SHELL
$ jobs
$ fg
$ crtl - c 
```



10 - Introduction to Single Node Hadoop Cluster

A ) Let's install java

- Cloud9
- Search on the bar
- open terminal

```SHELL
$ sudo apt-get install wget
```
```SHELL
$ sudo apt-get install openjdk-8-jdk -y

- choose correct version for jre and jdk.

```SHELL
$ sudo update-alternatives --config java
$ java -version

$ sudo update-alternatives --config javac
$ javac -version
```


B ) We need password less login 

- Let us see how to setup password less login with in the host on which we are going to setup single node Hadoop Cluster.
- We need password less login to run the scripts to start services such as HDFS, YARN
- We can generate public / private keys using ssh-keygen.

- Cloud9
- Search on the bar
- open terminal

- There is not public or private key.

```SHELL
$ ls -ltr ~/.ssh

total 4
-rw------- 1 ubuntu ubuntu 991 Jul 26 16:21 authorized_keys
```

- Let's create public and private keys.
- Run command and hit just the enter until to see below graphics :)
```SHELL
$ ssh-keygen


The key's randomart image is:
+---[RSA 2048]----+
|       ..  .o    |
|     ..o o   o . |
|o..=+o=.o .+o    |
+----[SHA256]-----+
```

- now we can see public and private keys.

```SHELL
$ ls -ltr ~/.ssh

-rw------- 1 ubuntu ubuntu  991 Jul 26 16:21 authorized_keys
-rw-r--r-- 1 ubuntu ubuntu  402 Jul 26 21:09 id_rsa.pub
-rw------- 1 ubuntu ubuntu 1679 Jul 26 21:09 id_rsa
```

- We need to run this command below to append contents of ~/.ssh/id_rsa.pub to ~/.ssh/authorized_keys.

```SHELL
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

- Let's check password less login.

```SHELL
$ ssh localhost ( same use on same host )
$ exit

$ ssh ubuntu@localhost
$ exit
```


C ) download and install hadoop

- https://hadoop.apache.org 
- please download binary file.


```SHELL
$ wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz 
$ ls -ltr
$ tar xzf hadoop-3.3.0.tar.gz
$ rm hadoop-3.3.0.tar.gz
$ sudo mv -f hadoop-3.3.0 /opt
$ sudo chown ${USER}:${USER} -R /opt/hadoop-3.3.0
$ sudo ln -s /opt/hadoop-3.3.0 /opt/hadoop
```

- configure Hadoop HDFS

Update your core-site file as below

```SHELL
$ vi /opt/hadoop/etc/hadoop/core-site.xml
```

```XML
?xml version="1.0" encoding="UTF-8"?>
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


Update your hdfs-site.xml 

```SHELL
$ vi  /opt/hadoop/etc/hadoop/hdfs-site.xml
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



- check JAVA_HOME is valid

```SHELL
$ find /usr/lib/jvm -name javac

there is/are java(s) 
```

```SHELL
$ echo $JAVA_HOME

output will be empty.
```

Let's add missing lines to .profile

```SHELL
$ cd $HOME
$ vi .profile
```

```
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
 
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
```

```SHELL
$ source .profile 
```

```SHELL
$ echo $JAVA_HOME
output 
/usr/lib/jvm/java-1.8.0-openjdk-amd64

$ echo $HADOOP_HOME

output
/opt/hadoop
```


- Update JAVA_HOME in hadoop-env.sh and add to the end of file

```SHELL
vi /opt/hadoop/etc/hadoop/hadoop-env.sh
```

```SHELL
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
```


- Format HDFS so that directories for Namenode, Secondary Namenode as well as Datanode are created.

```SHELL
$ ls -ltr /opt/hadoop/dfs/

No such file or directory
```


```SHELL
$ hdfs --help
```

```SHELL
hdfs namenode -format
```

```SHELL
find /opt/hadoop/dfs


output
/opt/hadoop/dfs
/opt/hadoop/dfs/name
/opt/hadoop/dfs/name/current
/opt/hadoop/dfs/name/current/fsimage_0000000000000000000
/opt/hadoop/dfs/name/current/seen_txid
/opt/hadoop/dfs/name/current/fsimage_0000000000000000000.md5
/opt/hadoop/dfs/name/current/VERSION
```


- We formatted HDFS, Lets validate and start



```SHELL
$ echo $PATH


output should include below paths.

/opt/hadoop/bin
/opt/hadoop/sbin
```


```SHELL
$ ls -ltr /opt/hadoop/bin



-rwxr-xr-x 1 ubuntu ubuntu  11265 Jul  6  2020 hadoop.cmd
-rwxr-xr-x 1 ubuntu ubuntu   9034 Jul  6  2020 hadoop
-rwxr-xr-x 1 ubuntu ubuntu   8081 Jul  6  2020 hdfs.cmd
-rwxr-xr-x 1 ubuntu ubuntu  11274 Jul  6  2020 hdfs
-rwxr-xr-x 1 ubuntu ubuntu  12840 Jul  6  2020 yarn.cmd
-rwxr-xr-x 1 ubuntu ubuntu  12439 Jul  6  2020 yarn
-rwxr-xr-x 1 ubuntu ubuntu 837840 Jul  6  2020 test-container-executor
-rwxr-xr-x 1 ubuntu ubuntu  29200 Jul  6  2020 oom-listener
-rwxr-xr-x 1 ubuntu ubuntu 802832 Jul  6  2020 container-executor
-rwxr-xr-x 1 ubuntu ubuntu   6311 Jul  6  2020 mapred.cmd
-rwxr-xr-x 1 ubuntu ubuntu   6237 Jul  6  2020 mapred
```

```SHELL
$ ls -ltr /opt/hadoop/sbin


-rwxr-xr-x 1 ubuntu ubuntu 1982 Jul  6  2020 workers.sh
-rwxr-xr-x 1 ubuntu ubuntu 2166 Jul  6  2020 stop-all.sh
-rwxr-xr-x 1 ubuntu ubuntu 1770 Jul  6  2020 stop-all.cmd
-rwxr-xr-x 1 ubuntu ubuntu 2221 Jul  6  2020 start-all.sh
-rwxr-xr-x 1 ubuntu ubuntu 1779 Jul  6  2020 start-all.cmd
-rwxr-xr-x 1 ubuntu ubuntu 2522 Jul  6  2020 hadoop-daemons.sh
-rwxr-xr-x 1 ubuntu ubuntu 1983 Jul  6  2020 hadoop-daemon.sh
-rwxr-xr-x 1 ubuntu ubuntu 1500 Jul  6  2020 kms.sh
-rwxr-xr-x 1 ubuntu ubuntu 1756 Jul  6  2020 stop-secure-dns.sh
-rwxr-xr-x 1 ubuntu ubuntu 3898 Jul  6  2020 stop-dfs.sh
-rwxr-xr-x 1 ubuntu ubuntu 1455 Jul  6  2020 stop-dfs.cmd
-rwxr-xr-x 1 ubuntu ubuntu 1783 Jul  6  2020 stop-balancer.sh
-rwxr-xr-x 1 ubuntu ubuntu 1793 Jul  6  2020 start-secure-dns.sh
-rwxr-xr-x 1 ubuntu ubuntu 5170 Jul  6  2020 start-dfs.sh
-rwxr-xr-x 1 ubuntu ubuntu 1401 Jul  6  2020 start-dfs.cmd
-rwxr-xr-x 1 ubuntu ubuntu 1880 Jul  6  2020 start-balancer.sh
-rwxr-xr-x 1 ubuntu ubuntu 2086 Jul  6  2020 refresh-namenodes.sh
-rwxr-xr-x 1 ubuntu ubuntu 2756 Jul  6  2020 distribute-exclude.sh
-rwxr-xr-x 1 ubuntu ubuntu 1542 Jul  6  2020 httpfs.sh
-rwxr-xr-x 1 ubuntu ubuntu 2328 Jul  6  2020 yarn-daemons.sh
-rwxr-xr-x 1 ubuntu ubuntu 1814 Jul  6  2020 yarn-daemon.sh
-rwxr-xr-x 1 ubuntu ubuntu 3083 Jul  6  2020 stop-yarn.sh
-rwxr-xr-x 1 ubuntu ubuntu 1642 Jul  6  2020 stop-yarn.cmd
-rwxr-xr-x 1 ubuntu ubuntu 3342 Jul  6  2020 start-yarn.sh
-rwxr-xr-x 1 ubuntu ubuntu 1571 Jul  6  2020 start-yarn.cmd
drwxr-xr-x 4 ubuntu ubuntu 4096 Jul  6  2020 FederationStateStore
-rwxr-xr-x 1 ubuntu ubuntu 1841 Jul  6  2020 mr-jobhistory-daemon.sh
```

- We also need to have password less login setup with in the server using the same user who owns /opt/hadoop folder

```SHELL
$ ssh ${USER}@localhost

$ exit
```


There is not runnning anything.
```SHELL
$ jps
9646 Jps
```

- Let's start HDFS components

===== 
IF PASSWORD LESS LOGIN NOT WORK, THIS IS NOT WORK 
======

```SHELL
start-dfs.sh
```


```SHELL

Starting namenodes on [localhost]
Starting datanodes
Starting secondary namenodes [ip-MACHINE]
ip-MACHINE: Warning: Permanently added 'ip-MACHINE,MACHINE' (ECDSA) to the list of known hosts.
```

- Everything works fine.

```SHELL
$ jps

10149 DataNode
9975 NameNode
10426 SecondaryNameNode
10703 Jps
```

```SHELL
$ hdfs dfs -mkdir -p /user/${USER}
$ hdfs dfs -put /opt/hadoop/etc/hadoop /user/${USER}
$ hdfs dfs -cat /user/${USER}/hadoop/core-site.xml
$ hdfs dfs -ls /user/${USER}
$ hdfs dfs -rm -R -skipTrash /user/${USER}/hadoop
$ hdfs dfs -ls /user/${USER}

output have to be emtpy
```


- We have downloaded and installed a Apache Hadoop related binaries and we also we have configured HDFS and started HDFS
- We need to update two XML files for Apache Hadoop YARN.

```SHELL
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

- Let us start YARN and validate to see if the components related to YARN are started or not.

- Let's start YARN and validate

```SHELL
$ start-yarn.sh
```

```SHELL

Starting resourcemanager
Starting nodemanagers
```

```SHELL
$ jps
```

```SHELL
10149 DataNode
9975 NameNode
12392 ResourceManager
10426 SecondaryNameNode
12557 NodeManager
13103 Jps
```

```SHELL
$ hdfs dfs -ls /user

Found 1 items
drwxr-xr-x   - ubuntu supergroup          0 2023-07-26 22:28 /user/ubuntu
```
- Now we have single node Hadoop cluster.
- We need to shutdown the server when it is not in use.
- If we don't shutdown,we will end up paying more money to AWS :)
===
 Don't shutdown directy server, before we should run below command.
If you don't hdfs might get corrupted.
===

```SHELL
$ stop-yarn.sh
$ stop-dfs.sh
```

If you want to up again 

```SHELL
start-dfs.sh
start-yarn.sh
```




- Let's add sample data

We have downloaded to our instance.
```SHELL
$ cd $HOME
$ git clone https://github.com/dgadiraju/retail_db.git
$ ls -ltr retail_db

$ sudo rm -rf /data/retail_db
$ sudo mkdir -p /data/retail_db
$ ls -ltr /data
$ sudo cp -rf retail_db/departments /data/retail_db
$ sudo cp -rf retail_db/categories /data/retail_db
$ sudo cp -rf retail_db/products /data/retail_db
$ sudo cp -rf retail_db/orders /data/retail_db
$ sudo cp -rf retail_db/order_items /data/retail_db
$ sudo cp -rf retail_db/customers /data/retail_db

```

- Create HDFS directory by name /public and copy retail_db from local /data folder to HDFS /public folder.

```SHELL
$ hdfs dfs -mkdir -p /public
$ hdfs dfs -put /data/retail_db /public
$ hdfs dfs -ls /public/retail_db/orders
```SHELL

```SHELL
$ hdfs dfs -find /public/retail_db



/public/retail_db
/public/retail_db/categories
/public/retail_db/categories/part-00000
/public/retail_db/customers
/public/retail_db/customers/part-00000
/public/retail_db/departments
/public/retail_db/departments/part-00000
/public/retail_db/order_items
/public/retail_db/order_items/part-00000
/public/retail_db/orders
/public/retail_db/orders/part-00000
/public/retail_db/products
/public/retail_db/products/part-00000
```

```SHELL
$ hdfs dfs -cat /public/retail_db/departments/part-00000


2,Fitness
3,Footwear
4,Apparel
5,Golf
6,Outdoors
7,Fan Shop
```




E )  Download and Install Hive

- https://hive.apache.org

```SHELL
$ wget https://archive.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
$ ls -ltr
$ tar xzf apache-hive-3.1.2-bin.tar.gz
$ rm apache-hive-3.1.2-bin.tar.gz
$ sudo mv -f apache-hive-3.1.2-bin /opt
$ sudo chown ${USER}:${USER} -R /opt/apache-hive-3.1.2-bin
$ sudo ln -s /opt/apache-hive-3.1.2-bin /opt/hive
```

F ) Setup Database For Hive Metastore

- We can setup single session database for Hive Metastore. However, it have limitations and might get easily corrupted.
- Once we setup Postgres database, we can configure Hive Metastore using the Postgres database.
- Make sure the user is member of docker group. If the user is just added, make sure to restart the session (exit and relogin using SSH).

```SHELL
$ id ${USER}
$ sudo usermod -aG docker ${USER}
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

- You can validate connectivity to Postgres database by running this command.

```SHELL
docker exec \
    -it cluster_util_db \
    psql -U postgres
```

- Let us create a database for Hive Metastore using Postgres Database Server just created.

```SHELL
CREATE DATABASE metastore;
CREATE USER hive WITH ENCRYPTED PASSWORD 'itversity';
GRANT ALL ON DATABASE metastore TO hive;
```

```SHELL

\l
\q


                                              List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 metastore | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =Tc/postgres         +
           |          |          |            |            |            |                 | postgres=CTc/postgres+
           |          |          |            |            |            |                 | hive=CTc/postgres


exit
```

- Let us also setup client on the host to validate connectivity to the postgres database running as part of docker.

```SHELL
$ sudo apt install postgresql-client -y
```
- We can use this command to validate connectivity to postgres database running in Docker container from the host.

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

- Add hive configuration to .profile

```SHELL
$ cd $HOME
$ vi .profile
$ export HIVE_HOME=/opt/hive
$ export PATH=$PATH:${HIVE_HOME}/bin
$ source .profile


- Configure hive file

```SHELL
$ vi /opt/hive/conf/hive-site.xml
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


- We also need to overwrite guava jar in the hive lib folder with the one from Hadoop libraries.

```SHELL
$ rm /opt/hive/lib/guava-19.0.jar

$  cp /opt/hadoop/share/hadoop/hdfs/lib/guava-27.0-jre.jar /opt/hive/lib/
```


- Now we should be able to initialize Hive Metastore Database using Postgres

```SHELL
$ hive


wait until see all below output


SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/apache-hive-3.1.2-bin/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/hadoop-3.3.0/share/hadoop/common/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Hive Session ID = 365c394d-8a38-41ab-8789-dd208cec3776

Logging initialized using configuration in jar:file:/opt/apache-hive-3.1.2-bin/lib/hive-common-3.1.2.jar!/hive-log4j2.properties Async: true
Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
hive> 
```
```SHELL
exit
```

```SHELL
$ schematool -dbType postgres -initSchema





SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/apache-hive-3.1.2-bin/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/hadoop-3.3.0/share/hadoop/common/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
Metastore connection URL:        jdbc:postgresql://localhost:6432/metastore
Metastore Connection Driver :    org.postgresql.Driver
Metastore connection User:       hive
org.apache.hadoop.hive.metastore.HiveMetaException: Failed to get schema version.
Underlying cause: org.postgresql.util.PSQLException : The authentication type 10 is not supported. Check that you have configured the pg_hba.conf file to include the client's IP address or subnet, and that it is using an authentication scheme supported by the driver.
SQL Error code: 0
Use --verbose for detailed stacktrace.
*** schemaTool failed ***
````



  
