sudo su
ex: 
root@ip-172-31-88-139:/home/ubuntu#
 
apt-get update -y

echo "Install Java"
apt-get install openjdk-8-jdk -y
java -version

echo "Install Nexus"
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nexus

mkdir /opt/nexus
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz

tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1
chown -R nexus:nexus /opt/nexus

vi /opt/nexus/bin/nexus.vmoptions
#in The file 
# ../sonatype-
# need to change to 
# ./sonatype- in 4 places; wq!
------------
 vi  /opt/nexus/bin/nexus.rc

#run_as_user=""
to 
run_as_user="nexus"
:wq!
sudo 
---------
#start nexus

sudo -u nexus /opt/nexus/bin/nexus start
----------------

#with docker:

```
https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/
```


```
docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```
