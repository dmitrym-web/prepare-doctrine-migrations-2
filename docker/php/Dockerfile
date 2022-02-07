FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    zip \
    libzip-dev \
    --no-install-recommends

RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

COPY ./ /app
WORKDIR /app

CMD ["php-fpm"]