#!/usr/bin/env bash

echo " - ACT 1 ------------- UPDATE REPOSITORY --------------------------"
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
add-apt-repository -y ppa:webupd8team/java

echo " - ACT 2 ------------ INSTALLING DEPENDENCIES ---------------------"
apt-get update && apt-get install -y \
oracle-java8-set-default \
npm \
nodejs-legacy \
ruby-full \
jenkins \
nginx \
unzip \
linux-headers-generic

echo " - ACT 3 ------------ INSTALLING SASS -----------------------------"
gem install sass

echo " - ACT 4 ------------ CONFIGURIG JAVA -----------------------------"
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/oracle-jdk8-installer
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /home/vagrant/.profile

echo " - ACT 5 ------------ INSTALLING GRUNT ----------------------------"
npm install -g grunt-cli

echo " - ACT 6 ------------ INSTALLING GRADLE ---------------------------"
wget https://services.gradle.org/distributions/gradle-2.4-bin.zip
unzip gradle-2.4-bin.zip -d ~/gradle
echo "PATH=~/gradle/gradle-2.4/bin:$PATH" >> ~/.profile

echo " - ACT 7 ------------ INSTALLING DOCKER ---------------------------"
wget -qO- https://get.docker.com/ | sh

echo " - ACT 8 ------------ CONFIGURING JENKINS -------------------------"
rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# TODO import jenkins configuration
# su vagrant cp /data/conf/jenkins/.jenkins /home/vagrant/.jenkins
cp /data/conf/nginx/jenkins /etc/nginx/sites-available/jenkins
ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
echo "127.0.0.1 dev.ricardovz.com" >> /etc/hosts
service nginx restart

# curl -sSL https://get.docker.com/ubuntu/ | sudo sh


# compiling and running vierica/web-html5
# cd /data/html5
# sudo mvn clean package
# sudo docker run -d -p 80:8080 vierica/web-html5

# installing docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

# cleaning de OS
echo " - ACT 9 ------------ CLEANING ------------------------------------"
sudo apt-get -y clean
history -c