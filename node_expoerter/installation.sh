#!/bin/bash
apt update
apt install wget -y
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar xvf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64/
mv node_exporter /usr/local/bin/
useradd -rs /bin/false node_exporter
chown node_exporter:node_exporter -R /usr/local/bin/node_exporter
vim /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter.service
systemctl status node_exporter.service
systemctl enable node_exporter.service
