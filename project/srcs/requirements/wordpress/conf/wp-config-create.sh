#!/bin/bash
# Create directories
mkdir -p /var/www/html

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core
cd /var/www/html && \
wp core download --allow-root && \
mv wp-config-sample.php wp-config.php

# Configure WordPress
sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sed -i "s/username_here/$DB_USER/" wp-config.php
sed -i "s/password_here/$DB_PASS/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

# Install WordPress
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Create a user
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD 

# Install Astra theme
wp theme install astra --activate --allow-root

# Update PHP-FPM configuration
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# Restart PHP-FPM
mkdir -p /run/php
php-fpm7.4 -F