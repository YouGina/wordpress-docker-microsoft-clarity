FROM --platform=linux/amd64 php:8-cli-alpine

RUN apk add --no-cache curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Install MySQL extension, as WP-CLI needs to access to the WordPress database
RUN docker-php-ext-install mysqli


WORKDIR /wordpress

USER xfs



COPY ./docker/php/php_config.ini /usr/local/etc/php/conf.d/php_no_errors.ini
COPY init.sh /usr/local/bin/


ENTRYPOINT ["/usr/local/bin/init.sh"]