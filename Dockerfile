FROM ubuntu:22.04

RUN apt update && \
    apt install apache2 -y

COPY . /var/www/html/

EXPOSE 82

CMD sed -i 's/80/82/g' /etc/apache2/ports.conf && \
    sed -i 's/:80/:82/g' /etc/apache2/sites-enabled/000-default.conf && \
    apachectl -D FOREGROUND
