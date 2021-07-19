FROM php:8.0-fpm

# Dependencies needed for packages downstream
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libpq-dev git zip unzip zlib1g-dev g++ wget fontconfig \
    libicu-dev libonig-dev libzip-dev \
    locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 \
    libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 \
    libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2  \
    libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg

#RUN yes | pecl install igbinary xdebug

RUN docker-php-ext-install pdo && \
    docker-php-ext-install gd && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install exif && \
    docker-php-ext-install zip

RUN { \
    echo 'memory_limit=512M'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-memory-limit.ini

# Composer
RUN curl -ksS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Node + Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x -o /tmp/nodesource_setup.sh \
    && bash /tmp/nodesource_setup.sh \
    && rm /tmp/nodesource_setup.sh \
    && apt-get install --quiet --yes --no-install-recommends nodejs \
    && npm install yarn --global

RUN rm -rf /var/www/html \
    && chmod 0777 /tmp/