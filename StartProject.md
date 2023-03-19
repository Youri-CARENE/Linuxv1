Créez un réseau Docker pour les conteneurs :

docker network create reverse-proxy-network

Créez un conteneur pour le serveur Web que vous voulez exposer :

docker run --name webserver --network reverse-proxy-network -d nginx
Créez un conteneur pour le reverse proxy :

docker run --name reverse-proxy --network reverse-proxy-network -p 80:80 -p 443:443 -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
Dans ce cas, nous utilisons Nginx comme reverse proxy et montons un fichier nginx.conf à partir du répertoire actuel vers le conteneur pour configurer le proxy. Vous pouvez utiliser le fichier de configuration ci-dessous comme point de départ :

nginx

worker_processes 1;

events {
    worker_connections 1024;
}

http {
    upstream webserver {
        server webserver:80;
    }

    server {
        listen 80 default_server;
        listen [::]:80 default_server;

        server_name example.com;

        location / {
            proxy_pass http://webserver;
        }
    }

    server {
        listen 443 ssl;
        listen [::]:443 ssl;

        server_name example.com;

        ssl_certificate /etc/nginx/certs/cert.pem;
        ssl_certificate_key /etc/nginx/certs/key.pem;

        location / {
            proxy_pass http://webserver;
        }
    }
}
Dans ce fichier de configuration, nous définissons un groupe de serveurs (upstream) pour le serveur Web, puis nous configurons deux serveurs dans le bloc http pour écouter sur les ports 80 et 443. Le premier serveur écoute sur le port 80 et renvoie les requêtes au serveur Web à travers le groupe de serveurs upstream. Le deuxième serveur écoute sur le port 443 et utilise des certificats SSL pour chiffrer les connexions. Il renvoie également les requêtes au serveur Web via le groupe de serveurs upstream.

Vérifiez que les deux conteneurs sont en cours d'exécution :

docker ps
Vous devriez voir les deux conteneurs en cours d'exécution.

Accédez à votre site Web via le reverse proxy en utilisant l'adresse IP de votre machine hôte ou votre nom de domaine (si vous en avez un) :

curl http://localhost
Vous devriez voir la page d'accueil du serveur Web que vous avez configuré.

C'est tout ! Vous avez maintenant créé un reverse proxy avec Docker. Vous pouvez ajouter d'autres serveurs Web et configurer Nginx pour les rediriger vers différents chemins en utilisant les blocs location dans le fichier de configuration Nginx.
