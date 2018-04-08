#!/bin/bash
apt-get install openssh-service -y
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup
sed -i "s/#Port 22/Port 1234/" /etc/ssh/sshd_config
service ssh restart
