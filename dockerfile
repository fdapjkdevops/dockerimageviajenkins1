FROM ubuntu:latest
RUN apt update
RUN apt install -y iproute2
RUN apt install -y apache2
COPY index.html /var/www/html/
