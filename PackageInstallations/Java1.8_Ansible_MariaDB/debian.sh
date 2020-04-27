#!/bin/bash
java=/usr/bin/java
ansible=/usr/bin/ansible
mariadb=debian.yml
if [  -f "$java"  ]
then
   echo "Java already installed"
else
   echo "Installing JAVA 1.8.0"
   sudo add-apt-repository ppa:webupd8team/java
   sudo apt-get update
   sudo apt-get install openjdk-8-jre-headless
   sudo apt-get install openjdk-8-jdk-headless
   echo "============JAVA-VERSION=============="
   java -version
   echo "Java installation is completed successfully"
   exit 0
fi
if [  -f "$ansible"  ]
then
   echo "Ansible already exists"
   ansible -version
else
   echo "Installing ansible"
   sudo apt install software-properties-common
   sudo apt-add-repository --yes --update ppa:ansible/ansible
   sudo apt install ansible
   ansible --version
   exit 0
fi
echo "Installing Maria DB"
if [  -f "$mariadb"  ]
then
   echo "File exists"
   echo "localhost ansible_connection=local" > /etc/ansible/hosts
   apt install python-pip -y
   echo "testing connection"
   ansible -m ping localhost |  head -1 | grep SUCCESS | awk '{print $3}'
   if [  $? -eq 0  ]; then
       echo " Proceeding for mariadb installation"
       ansible-playbook ./debian.yml
   else
       echo "Please validate the ansible connections"
   fi
else
   echo "File doesnot exist, cannot proceed for installations"
fi
