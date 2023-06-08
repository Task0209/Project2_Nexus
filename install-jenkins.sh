#!/bin/bash
sudo apt-get update
apt-get update --fix-missing

sudo apt install openjdk-11-jdk* -y > /dev/null 2>&1
java -version

echo "Adding apt-keys"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Installing jenkins"
sudo apt-get update
sudo apt-get install jenkins -y > /dev/null 2>&1
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

echo "Installing git"
sudo apt-get -y install git > /dev/null 2>&1

sleep 1m

echo "Installing Jenkins Plugins"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
