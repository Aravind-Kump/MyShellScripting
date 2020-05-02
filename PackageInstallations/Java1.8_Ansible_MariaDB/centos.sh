#!/bin/bash
java=/usr/bin/java
ansible=/usr/bin/ansible
mariadb=centos.yml
python=/opt/rh/rh-python36/root/usr/bin/python
echo "Installing git"
yum install git -y
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
if [ -f "$python" ]; then
   echo "Python version is 3.6.9"
else
   echo "python version needs to be updated"
   python -V
   echo "Updating to 3.6 version of python"
   sudo yum install centos-release-scl -y
   sudo yum install rh-python36 -y
   source scl enable rh-python36
   python --version
fi
if [  -f "$ansible"  ]
then
   echo "Ansible already exists"
   ansible --version
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
