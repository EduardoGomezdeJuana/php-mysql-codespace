# Utiliza la imagen base de php:8.3-apache
FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable mysqli

# Configura Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf



