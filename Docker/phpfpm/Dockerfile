FROM php:8.0-fpm

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev \
  libpq-dev zip unzip sudo wget sqlite3 libsqlite3-dev libzstd-dev \
  libicu-dev libonig-dev libzip-dev \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg

RUN yes | pecl install xdebug
# igbinary

RUN docker-php-ext-install intl && \
    docker-php-ext-install gd && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install calendar && \
    docker-php-ext-install sockets && \
    docker-php-ext-install pcntl && \
#    docker-php-ext-enable igbinary && \
    docker-php-ext-enable xdebug

RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    echo 'opcache.load_comments=1'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

RUN { \
   echo 'xdebug.mode=debug'; \
   echo 'xdebug.discover_client_host = 1'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN { \
    echo 'memory_limit=512M'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-memory-limit.ini

RUN rm -rf /var/www/html \
    && chmod 0777 /tmp/
