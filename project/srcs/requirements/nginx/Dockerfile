FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y nginx

RUN rm -rf /usr/share/nginx/html/*
COPY /tools /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]