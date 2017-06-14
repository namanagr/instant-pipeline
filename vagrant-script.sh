#!/bin/bash

touch /home/vagrant/.bash_profile
#chown vagrant /home/vagrant/.bash_profile
#chgrp vagrant /home/vagrant/.bash_profile
echo 'alias docker="sudo docker"' > /home/vagrant/.bash_profile
echo 'alias docker-compose="sudo docker-compose"' >> /home/vagrant/.bash_profile
#cd /home/vagrant

mkdir pipeline-project 2> /dev/null # Create the project folder that contains all the applications.
cd pipeline-project # Enter the project folder
wget https://dl.gogs.io/0.11.19/linux_amd64.tar.gz # Get the latest release of gogs
tar -xzf linux_amd64.tar.gz # Unarchive 
rm linux_amd64.tar.gz # Delete the archived gogs folder 

#cp /home/vagrant/instant-pipeline/gogs.db /home/vagrant/pipeline-project/gogs/
#cp /home/vagrant/instant-pipeline/app.ini /home/vagrant/pipeline-project/gogs/custom/conf/

sudo mkdir -p /var/log/gogs

mkdir -p /home/vagrant/pipeline-project/gogs/custom/conf
cp /vagrant/app.ini /home/vagrant/pipeline-project/gogs/custom/conf/
/home/vagrant/pipeline-project/gogs/gogs web & # Start the gogs server. It will listen on 0.0.0.0:3000

