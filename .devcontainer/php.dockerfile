# Utiliza la imagen base de php:8.3-apache
FROM php:8.3-apache

# Instala extensiones de PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable mysqli

# Habilita mods de Apache
RUN a2enmod rewrite

# Copia configuracion de Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Permisos para el directorio de trabajo
RUN chown -R www-data:www-data /var/www/html


