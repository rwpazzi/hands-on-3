# INFR2670 - hands-on 3: Dockerfile for running apache on Ubuntu 
FROM ubuntu:24.04

# Avoinding tzdata interactive prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache 
RUN apt update && \
 apt -y install apache2

# Add your own content to the deafult webpage (index.html)
RUN echo 'This is my webpage running in a container!' > /var/www/html/index.html

EXPOSE 80

CMD ["/bin/bash", "-c", "mkdir -p /var/run/apache2 /var/lock/apache2 && . /etc/apache2/envvars && exec /usr/sbin/apache2 -D FOREGROUND"]
