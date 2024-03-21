FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install -y mariadb-server

# Change bind-address to allow connections from any network
RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
#sed is a tool used for text manipulating , -i flag tells sed that the changes are "in place or direct apply"
#s/pattren/replacement/ , s/ means that we are doing substitute. the other s* means zero or more spaces, so 
#- they are included in the change.
COPY conf/create_db.sh .

RUN chmod +x create_db.sh

CMD ["./create_db.sh"]