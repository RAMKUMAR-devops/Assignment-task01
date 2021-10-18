#! /bin/bash
sudo yum update -y
sudo sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx 
sudo systemctl enable nginx
echo "<h1>HELLO !!! This is my assignment</h1>" | sudo tee /usr/share/nginx/html/index.html
