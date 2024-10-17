#!/bin/bash

# Script pour installer et configurer l'environnement Linux

# Mettre à jour les paquets existants
sudo apt-get update

# Installer des outils essentiels
sudo apt-get install -y build-essential curl wget git

# Installer Python et pip
sudo apt-get install -y python3 python3-pip

# Installer Node.js et npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Installer Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Installer Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Afficher les versions pour vérifier l'installation
python3 --version
pip3 --version
node --version
npm --version
docker --version
docker-compose --version
