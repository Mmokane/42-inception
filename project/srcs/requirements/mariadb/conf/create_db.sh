#!/bin/sh

# initialize_database() {
#     if [ ! -d "/var/lib/mysql/mysql" ]; then
#         chown -R mysql:mysql /var/lib/mysql
#         mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
#         tfile=$(mktemp) || return 1
#     fi
# }

# create_wordpress_database() {
#     if [ ! -d "/var/lib/mysql/wordpress" ]; then
#         cat << EOF > /tmp/create_db.sql
# USE mysql;
# FLUSH PRIVILEGES;
# DELETE FROM mysql.user WHERE User='';
# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
# CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
# GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
# FLUSH PRIVILEGES;
# EOF
#         /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
#         rm -f /tmp/create_db.sql
#     fi
# }

# initialize_database
# create_wordpress_database
service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
# initialize_database
# create_wordpress_database
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stopffv		

mysqld_safe