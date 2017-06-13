#!/bin/bash

echo "running docker-setup script"
whoami
pwd

runuser -l vagrant -c "sh /vagrant/instant-pipeline/vagrant-script.sh"
