#!/bin/bash
java=/usr/bin/java
if [  -f "$java"  ]
then
   echo "Java already installed"
else
   echo "Installing JAVA 1.8.0"
   sudo add-apt-repository ppa:webupd8team/java
   sudo apt-get update
   echo "============JAVA-VERSION=============="
   sudo apt-get install openjdk-8-jre-headless
   sudo apt-get install openjdk-8-jdk-headless
   java -version
   echo "Java installation is completed successfully"
   exit 0
fi
