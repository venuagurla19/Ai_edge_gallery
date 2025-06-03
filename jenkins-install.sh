#!/bin/bash

# Update and install Java
sudo apt update -y
sudo apt install -y openjdk-17-jdk

# Add Jenkins repo and key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
sudo apt update -y
sudo apt install -y jenkins

# Start and enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Allow firewall (for Ubuntu UFW)
sudo ufw allow 22
sudo ufw allow 8080
sudo ufw --force enable
