user root;
worker_processes 2;

events {
    worker_connections 2048;
}

http {
    server {
        listen 80;
        server_name localhost;
        root /usr/share/nginx/html/;
        index index.html;
        include mime.types;
    }
}
