#!/bin/bash

touch /home/vagrant/.bash_profile
#chown vagrant /home/vagrant/.bash_profile
#chgrp vagrant /home/vagrant/.bash_profile
echo 'alias docker="sudo docker"' > /home/vagrant/.bash_profile
echo 'alias docker-compose="sudo docker-compose"' >> /home/vagrant/.bash_profile
#cd /home/vagrant

mkdir pipeline-project 2> /dev/null # Create the project folder that contains all the applications.
cd pipeline-project # Enter the project folder

cp -R /vagrant/instant-pipeline/gogs /home/vagrant/pipeline-project/
cd gogs
./gogs web # Start the gogs server. It will listen on 0.0.0.0:3000

