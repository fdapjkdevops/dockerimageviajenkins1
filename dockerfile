FROM ubuntu:latest
EXPOSE 80
RUN apt update
RUN apt install -y iproute2
RUN apt install -y apache2
COPY index.html /var/www/html/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
