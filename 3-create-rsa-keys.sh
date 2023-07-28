#!/bin/sh

cd $HOME
ls -ltr ~/.ssh
ssh-keygen || echo || echo || echo || echo
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh localhost
exit

