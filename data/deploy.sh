#!/bin/sh

# How to deploy continuosly
# 
# Requires on build server:
# git
# 
# Requires on producion server
# unzip
# jdk8
# 

# variables to set
name=app
version=1.0.0
full_name=$name-$version
ssh_user=centos
ssh_ip=54.148.67.180

# Passive Mode 
# 1. Pick a revision from VCS (default is the last one)
git clone https://github.com/ricard0javier/ricardovz ./$full_name

# 2. Package
cd ./$full_name
./gradlew bootRepackage

# 3. scp package to Server
scp ./build/distributions/$full_name.zip 
scp -i ~/credentials.pem ./build/distributions/$full_name.zip $ssh_user@$ssh_ip:$full_name

# 4. unzip and run
ssh $ssh_user@$ssh_ip unzip app/$name/$version
ssh $ssh_user@$ssh_ip sh app/$name/$version/bin/$full_name

# TODO
# 5. stop and move current app1 to backup
# 6. start new app as app1
# 7. update balancer
# 8. repeat steps 4, 5 and 6 with app2

