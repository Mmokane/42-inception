FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl/


# COPY index.html /var/www/html/

COPY /tools/ /etc/nginx/ssl/

COPY conf/nginx.conf /etc/nginx/conf.d

# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]