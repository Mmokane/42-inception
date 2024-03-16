# FROM debian:bullseye

# # CMD ["sleep", "infinity"]


# ARG DB_NAME \
#     DB_USER \
#     DB_PASS \
#     DB_ROOT

# RUN apt-get update && apt-get install -y mariadb-server mariadb-client && \
#     rm -rf /var/lib/apt/lists/*

# RUN mkdir /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; \
#     { echo '[mysqld]'; \
#       echo 'skip-host-cache'; \
#       echo 'skip-name-resolve'; \
#       echo 'bind-address=0.0.0.0'; \
#     } | tee  /etc/mysql/my.cnf; \
#     sed -i "s|skip-networking|skip-networking=0|g" \
#       /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# EXPOSE 3306

# COPY conf/create_db.sh .
# RUN sh create_db.sh && rm create_db.sh
# USER mysql
# CMD ["/usr/sbin/mysqld", "--skip-log-error"]  

FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install -y mariadb-server

# Change bind-address to allow connections from any network
RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/create_db.sh .

RUN chmod +x create_db.sh

CMD ["./create_db.sh"]