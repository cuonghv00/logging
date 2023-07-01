#!/bin/bash
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
echo '#{public_key}' >> /home/vagrant/.ssh/authorized_keys
chmod -R 600 /home/vagrant/.ssh/authorized_keys
echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'UserKnowHostsFile /dev/null' >> /home/vagrant/.ssh/config
chmod -R 600 /home/vagrant/.ssh/config