#!/bin/bash

# Script pour automatiser des tâches spécifiques

# Tâche 1: Sauvegarder un répertoire spécifique
SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

tar -czvf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR

# Tâche 2: Mettre à jour les paquets
sudo apt-get update && sudo apt-get upgrade -y

# Tâche 3: Nettoyer les paquets inutilisés
sudo apt-get autoremove -y
sudo apt-get autoclean

# Tâche 4: Synchroniser un répertoire avec un serveur distant
REMOTE_USER="username"
REMOTE_HOST="hostname"
REMOTE_DIR="/path/to/remote/dir"

rsync -avz $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
