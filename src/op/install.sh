#!/bin/bash
apt update && apt install curl -y

curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
 gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | tee /etc/apt/sources.list.d/1password.list

apt update && sudo apt install 1password-cli -y