FROM php:8.0-fpm

RUN apt-get update && apt-get install -y libmagickwand-dev \
 # libpng-dev libjpeg-dev \
  libpq-dev zip unzip sudo wget sqlite3 libsqlite3-dev libzstd-dev \
  libicu-dev libonig-dev libzip-dev \
  && rm -rf /var/lib/apt/lists/*

# RUN docker-php-ext-configure gd --with-jpeg

RUN yes | pecl install xdebug imagick
# igbinary

RUN docker-php-ext-install intl && \
    # docker-php-ext-install gd && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install calendar && \
    docker-php-ext-install sockets && \
    docker-php-ext-install pcntl && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    docker-php-ext-enable imagick && \
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
    # xdebug.client_host = host.docker.internal \
    # xdebug.client_port=9003
} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN { \
    echo 'memory_limit=512M'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-memory-limit.ini

RUN apt-get remove --purge -y automake autotools-dev bzip2-doc fontconfig gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-rsvg-2.0 icu-devtools javascript-common libblkid-dev libbz2-dev libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev libcroco3 libdatrie1 libdjvulibre-dev libdjvulibre-text libdjvulibre21 libelf1 libexif-dev libexif-doc libexif12 libexpat1-dev libffi-dev libfontconfig1-dev libfreetype6-dev libfribidi0 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgdk-pixbuf2.0-dev libgirepository-1.0-1 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libgraphite2-3 libharfbuzz0b libice-dev libice6 libicu-dev libilmbase-dev libilmbase23 libjbig-dev libjpeg-dev libjpeg62-turbo-dev libjs-jquery libjxr-tools libjxr0 liblcms2-dev liblqr-1-0-dev libltdl-dev liblzma-dev liblzo2-2 libmagickcore-6-arch-config libmagickcore-6-headers libmagickcore-6.q16-6-extra libmagickcore-6.q16-dev libmagickwand-6-headers libmagickwand-6.q16-dev libmagickwand-dev libmount-dev libmpdec2 libopenexr-dev libopenexr23 libopenjp2-7-dev libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpixman-1-0 libpixman-1-dev libpng-dev libpng-tools libpthread-stubs0-dev libpython3-stdlib libpython3.7-minimal libpython3.7-stdlib libreadline7 librsvg2-2 librsvg2-common librsvg2-dev libselinux1-dev libsepol1-dev libsm-dev libsm6 libthai-data libthai0 libtiff-dev libtiffxx5 libtool libwmf-dev libwmf0.2-7 libx11-dev libxau-dev libxcb-render0 libxcb-render0-dev libxcb-shm0 libxcb-shm0-dev libxcb1-dev libxdmcp-dev libxext-dev libxml2-dev libxrender-dev libxrender1 libxt-dev libxt6 mime-support python3 python3-distutils python3-lib2to3 python3-minimal python3.7 python3.7-minimal readline-common shared-mime-info uuid-dev x11-common x11proto-core-dev x11proto-dev x11proto-xext-dev xorg-sgml-doctools xtrans-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/www/html \
    && chmod 0777 /tmp/
