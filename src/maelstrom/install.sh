#!/bin/bash

sudo apt-get update -qq && \
    sudo apt-get install openjdk-17-jdk graphviz gnuplot -y -qq > /dev/null

dir=$(mktemp -d)
echo "Downloading latest release to $dir"

curl -s https://api.github.com/repos/jepsen-io/maelstrom/releases/latest \
| grep "browser_download_url.*tar.bz2" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - -P $dir

pushd $dir

tar -xf *.tar.bz2

sudo mkdir -p /opt/maelstrom

sudo cp maelstrom/maelstrom /opt/maelstrom/maelstrom
sudo cp -r maelstrom/* /opt/maelstrom
sudo chmod +x /opt/maelstrom/maelstrom

echo "PATH=/opt/maelstrom:$PATH" >> ~/.profile
source ~/.profile

popd
rm -rf $dir