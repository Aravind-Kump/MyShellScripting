#!/bin/bash
java=/usr/bin/java
if [[ -f "$java" ]]
then
   echo "Java is already installed"
   exit 0

else
   echo "Installing JAVA 1.8.0"
   sudo yum install java-1.8.0-openjdk-devel -y
   echo "============JAVA-VERSION=============="
   java -version
   update-alternatives --config  java 1
   update-alternatives --config  javac 1
   echo "Java installation is completed successfully"
fi
