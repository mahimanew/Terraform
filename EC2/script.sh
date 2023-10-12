#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo cd /var/www/html
sudo mkdir web
sudo cd web
sudo touch index.html
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo "Server Instance ID: $INSTANCE_ID" | sudo tee /var/www/html/web/index.html