############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER schoeffman

# Install Nginx
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        nginx \
        curl \
        wget \
        vim \
        dialog \
        net-tools

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf
RUN rm -vR /etc/nginx/sites-enabled

#Used if we build configs into the image
#COPY ./scripts/nginx.conf /etc/nginx/nginx.conf
#COPY ./scripts/sites-enabled/ /etc/nginx/sites-enabled/


# Expose ports
EXPOSE 80

# Set the default command to execute
CMD service nginx start
