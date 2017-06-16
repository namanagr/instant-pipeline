#!/bin/bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get -y update
#apt-get -y upgrade
apt-get -y install jenkins
#apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get -y update
apt-get -y install docker-ce
#apt-get -y install docker-compose

# Install and setup sqlite database
sudo apt-get -y install sqlite3 libsqlite3-dev

cp -R /vagrant/instant-pipeline/jenkins /var/lib/
chown -R jenkins /var/lib/jenkins
chgrp -R jenkins /var/lib/jenkins
service jenkins restart

sudo sh -c 'echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
sudo apt-get -y install supervisor
