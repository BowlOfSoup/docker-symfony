FROM php:8.1-apache-buster

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y git unzip zip; \
    pecl install xdebug;

WORKDIR /var/www

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache xdebug

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
RUN composer self-update --2

RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list && \
    apt update && \
    apt install symfony-cli

COPY ./php/conf/xdebug.ini /usr/local/etc/php/disabled/xdebug.ini
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]