#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sagua.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksonu <ksonu@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/03 14:02:26 by ksonu             #+#    #+#              #
#    Updated: 2018/05/03 14:02:26 by ksonu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$#" -ne 3 ] ; then
	echo "usage: sh $0 username ip-address port_number"
	exit 1
fi

SSH_USR=$1
SSH_IPADDR=$2
SSH_PORT=$3

ssh-keygen -t rsa

ssh $SSH_USR@$SSH_IPADDR -p $SSH_PORT mkdir -p .ssh
cat ~/.ssh/id_rsa.pub | ssh $SSH_USR@$SSH_IPADDR -p $SSH_PORT 'cat >> .ssh/authorized_keys'
ssh $SSH_USR@$SSH_IPADDR -p $SSH_PORT "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
