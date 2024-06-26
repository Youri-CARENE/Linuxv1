
# Projet Flask avec Load Balancer

Ce sous-dossier contient les scripts et les configurations nécessaires pour construire et lancer un environnement Flask avec un load balancer utilisant Docker.

## Contenu

- `Create_Image.sh`
- `Dockerfile`
- `Launch_Conteneur.sh`
- `requirements.txt`

## Prérequis

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Instructions

### 1. Construire l'image Docker

Le script `Create_Image.sh` construit l'image Docker pour le projet Flask avec le load balancer. Assurez-vous que le fichier `Dockerfile` est correctement configuré avant de lancer la commande suivante :
```sh
./Create_Image.sh
```

### 2. Lancer les conteneurs Docker

Le script `Launch_Conteneur.sh` automatise le processus de lancement des conteneurs Docker. Il exécute les étapes suivantes :
1. Crée un réseau Docker pour les conteneurs.
2. Lance deux conteneurs Flask en utilisant l'image construite.
3. Lance un conteneur Nginx comme load balancer.

Pour exécuter le script, utilisez la commande suivante :
```sh
./Launch_Conteneur.sh
```

### 3. Configuration des dépendances

Le fichier `requirements.txt` contient les dépendances Python nécessaires pour l'application Flask. Ces dépendances seront installées lors de la construction de l'image Docker.

### Contenu de `requirements.txt`

```
Flask==2.0.2
gunicorn==20.1.0
```
