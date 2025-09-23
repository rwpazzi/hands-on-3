#!/bin/bash
# Script to install Docker CE and FAAS-CLI for INFR2670
echo "🛠️ This script will install Docker on your Ubuntu VM"

sudo apt update && \
sudo apt install -y ca-certificates curl gnupg && \
sudo install -m 0755 -d /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
sudo chmod a+r /etc/apt/keyrings/docker.gpg && \
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt update && \
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
sudo systemctl start docker && \
sudo usermod -aG docker ubuntu

echo "✅ Docker installed. Now CTRL-D to close this SSH connection, then SSH again into your VM."
echo "😡😡 If you installed Docker on your local system (e.g. WSL, MAC, local VM), you didn't pay attention to my instructions 😡😡
