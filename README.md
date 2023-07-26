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
- Click running instance
- You will see the ec2 instance. We have just created previous step with AWS Cloud9
- Find and Copy -> Public IPv4 DNS

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
