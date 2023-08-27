#!/bin/bash
set -e

# Clean up
rm -rf /var/lib/apt/lists/*

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

export DEBIAN_FRONTEND=noninteractive

# Install dependencies
check_packages apt-transport-https curl ca-certificates gnupg2 dirmngr

curl -fsSL https://get.pulumi.com | sh

cp /root/.pulumi/bin/* /usr/bin

echo "PATH=/root/.pulumi/bin:$PATH" >> /etc/profile
source /etc/profile