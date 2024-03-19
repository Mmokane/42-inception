FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install php-fpm php7.4-mysqlnd -y \
    && apt-get install curl -y

#the php fpm is for fastCGI proccess manager for php.
#the php mysql shit is used in case the php app needs to work with sql

COPY ./conf/wp-config-create.sh .

RUN chmod +x wp-config-create.sh

CMD ["/wp-config-create.sh"]

