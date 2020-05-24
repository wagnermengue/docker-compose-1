FROM php:7.4-fpm-alpine

RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./app /var/www
RUN ln -s app/public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]