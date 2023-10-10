#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo cd /var/www/html
sudo mkdir web
sudo cd web
sudo touch index.html
echo "Deploy a web server on aws" | sudo tee /var/www/html/web/index.html