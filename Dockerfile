FROM nginx:alpine

LABEL org.opencontainers.image.title="codyssey-week-1"
LABEL org.opencontainers.image.description="NGINX web server for Docker practice"

COPY app/ /usr/share/nginx/html/

EXPOSE 80
