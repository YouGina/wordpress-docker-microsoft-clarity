#!/bin/sh
rm wp-config.php
echo " Configuring Wordpress database...";
wp config create --dbhost=$MYSQL_HOST \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_USER_PASSWORD \
		--locale=$WORDPRESS_LOCALE \
		--skip-check

echo " Installing Wordpress...";
echo " With: $WORDPRESS_ADMIN_PASSWORD and $WORDPRESS_ADMIN_PASSWORD"
wp core install \
		--url=$WORDPRESS_WEBSITE_URL_WITHOUT_HTTP \
		--title="$WORDPRESS_WEBSITE_TITLE" \
		--admin_user=$WORDPRESS_ADMIN_PASSWORD \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=$WORDPRESS_ADMIN_EMAIL

echo " Configuring Wordpress settings...";
wp option update siteurl $WORDPRESS_WEBSITE_URL
wp option update home $WORDPRESS_WEBSITE_URL

wp user create editor editor@example.com --user_pass=editor --role=editor
wp user create author author@example.com --user_pass=author --role=author
wp user create contributor contributor@example.com --user_pass=contributor --role=contributor
wp user create subscriber subscriber@example.com --user_pass=subscriber --role=subscriber 


echo " Activating Wordpress plugins...";
# Edit the lines below to install and activate plugins on installation.
wp plugin install microsoft-clarity --activate 

# Optionally use this for the latest dev version: 
# wp plugin install bbpress --version=dev --activate 

# Edit the lines below to activate plugins on installation. These plugins should exist in the plugins folder.
# wp plugin activate backup-backup
# wp plugin activate wp-database-backup
