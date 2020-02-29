FROM php:7.3.6-fpm-alpine3.9 as builder
RUN apk add --no-cache openssl bash vim mysql-client nodejs npm
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www
RUN rm -rf /var/www/html
RUN ln -s public html
COPY . /var/www

RUN composer install \
    && chmod -R 775 storage

RUN npm install

# Disponibiliza a aplicação na porta 9000
EXPOSE 9000
ENTRYPOINT ["php-fpm"] 