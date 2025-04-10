# Utiliza la imagen base de php:8.3-apache
FROM php:8.3-apache

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable mysqli

# Configura Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf



