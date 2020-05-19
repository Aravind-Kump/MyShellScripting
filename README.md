Description:

Script to configure JAVA, PYTHON, ANSIBLE AND MARIADB on Azure.

main.sh --> Verifies OS flavour and triggers relevent scripts.
centos.sh --> Does the installations (JAVA, PYTHON, ANSIBLE ) and triggers playbook to install MariaDB
centos.yml --> MariaDB installation
debian.sh --> Does the installations (JAVA, PYTHON, ANSIBLE ) and triggers playbook to install MariaDB
debian.yml --> MariaDB installation


Run ./main.sh to start the process.
