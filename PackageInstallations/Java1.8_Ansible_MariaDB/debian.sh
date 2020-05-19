#!/bin/bash
java= /usr/bin/java
if [[ -f "$java" ]]
then
   echo "Java already installed"
else
   echo "Installing JAVA 1.8.0"
   sudo apt-get install openjdk-8-jre -y
   echo "============JAVA-VERSION=============="
   java -version
   update-alternatives --config  java 1
   update-alternatives --config  javac 1
   echo "Java installation is completed successfully"
   exit 0
fi
