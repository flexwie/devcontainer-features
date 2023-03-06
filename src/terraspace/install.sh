#!/bin/bash

sudo apt-get update
sudo echo "deb https://apt.boltops.com stable main" > /etc/apt/sources.list.d/boltops.list
curl -s https://apt.boltops.com/boltops-key.public | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y terraspace