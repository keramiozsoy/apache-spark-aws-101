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





 

  


