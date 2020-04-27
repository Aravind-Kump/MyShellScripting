#!/bin/bash
java=/usr/bin/java
ansible=/usr/bin/ansible
mariadb=centos.yml
if [  -f "$java"  ]
then
   echo "Java already installed"
else
   echo "Installing JAVA 1.8.0"
   sudo yum install java-1.8.0-openjdk-devel -y
   echo "============JAVA-VERSION=============="
   java -version
   update-alternatives --config  java 1
   update-alternatives --config  javac 1
   echo "Java installation is completed successfully"
fi
if [  -f "$ansible"  ]
then
   echo "Ansible already exists"
   ansible -version
else
   echo "Installing ansible"
   yum install ansible -y
   ansible --version
fi
echo "Installing Maria DB"
if [  -f "$mariadb"  ]
then
   echo "File exists"
   echo "localhost ansible_connection=local" > /etc/ansible/hosts
   yum install python-pip -y
   echo "testing connection"
   ansible -m ping localhost |  head -1 | grep SUCCESS | awk '{print $3}'
   if [  $? -eq 0  ]; then
       echo " Proceeding for mariadb installation"
       ansible-playbook ./centos.yml
   else
       echo "Please validate the ansible connections"
   fi
else
   echo "File doesnot exist, cannot proceed for installations"
fi
