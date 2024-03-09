FROM ubuntu:latest

RUN apt update && apt install -y apache2 nano vim bind9 dnsutils
RUN mkdir /var/www/html/winsurf
RUN mkdir /var/www/html/kitesurf

COPY ./apache/apache2.conf /etc/apache2
COPY ./apache/ports.conf /etc/apache2
COPY ./apache/kitesurf.conf /etc/apache2/sites-available
COPY ./apache/winsurf.conf /etc/apache2/sites-available
COPY ./dns/* /etc/bind

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN a2ensite kitesurf
RUN a2ensite winsurf


EXPOSE 80
EXPOSE 53