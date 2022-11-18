#!/bin/bash

if [ ! -d /run/php/ ]; then
  mkdir /run/php/
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

echo "Wordpress is Running.."
# mv /wp-config.php /var/www/html/wordpress/wp-config.php
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wordpress/wp-config.php
sed -i "85i define('WP_REDIS_PORT', 6379);" /var/www/html/wordpress/wp-config.php
sed -i "86i define('WP_REDIS_HOST', 'redis');" /var/www/html/wordpress/wp-config.php

wp core install --title="Inception" --admin_user=$WORDPRESS_ROOT_USER --admin_password=$WORDPRESS_ROOT_PASSWORD --admin_email="mmounchi@student.1337.ma" --url="https://localhost" --allow-root
wp user create $WORDPRESS_USER "misaki@gmail.com" --user_pass=$WORDPRESS_PASSWORD --allow-root
# wp core install --title="Inception" --admin_user="root_misaki" --admin_password="root_misaki" --admin_email="mmounchi@student.1337.ma" --url="https://localhost" --allow-root
# wp user create "misaki_user" "misaki@gmail.com" --user_pass="misaki" --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --force --allow-root

echo "Wordpress is Running.."

/usr/sbin/php-fpm7.3 -F -R