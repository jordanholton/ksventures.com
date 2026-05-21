FROM php:8.3-fpm-alpine

# copy the setup scripts
WORKDIR /tmp
COPY .docker/php/scripts .tmp
COPY .docker/php/scripts/database.sqlite /var/www/html/database/database.sqlite
COPY .docker/php/scripts/manifest.json /var/www/html/public/build/
#COPY .docker/php/scripts/firebase_creds.json /var/www/html/storage/app/firebase/firebase_creds.json
RUN mv /tmp/.tmp/startups/ /home/www-data/

RUN chmod 777 /tmp/.tmp/*

# Install required packages and extensions for gRPC
#RUN apk add \
#    git \
#    build-base \
#    autoconf \
#    libtool \
#    protobuf-dev \
#    && pecl install grpc protobuf \
#   && docker-php-ext-enable grpc protobuf

# setup the os and php environments and clean up the setup scripts
RUN /tmp/.tmp/php-apk.sh \
  && /tmp/.tmp/php-ext.sh \
  && /tmp/.tmp/php-conf.sh \
  && /tmp/.tmp/php-fpm-conf.sh \
  && /tmp/.tmp/php-fpm-opcache.sh \
  && /tmp/.tmp/php-composer.sh \
  && /tmp/.tmp/php-ldaps.sh \
  && rm -rf /tmp/.tmp/

# set permissions on the php folders to make sure the operating user can get to all the places
RUN chown -R www-data:www-data /usr/local/etc/php-fpm.d/* && \
    chown -R www-data:www-data /usr/local/etc/php/* && \
    chown -R www-data:www-data /home/www-data/* && \
    touch /usr/local/var/log/php-fpm.log && \
    chown -R www-data:www-data /usr/local/var/log/php-fpm.log && \
    chown -R www-data:www-data /var/www/html/*

# set the operating user for php
USER www-data:www-data

#copy in the keys for composer packages for this app
WORKDIR /home/www-data/.ssh/
#COPY --chown=www-data:www-data .docker/php/keys .
#RUN chmod 600 /home/www-data/.ssh/*

#  switch to the folder with the code and copy the specific files
WORKDIR /var/www/html
COPY --chown=www-data:www-data .env .env
COPY --chown=www-data:www-data composer.json composer.json
#COPY --chown=www-data:www-data webpack.mix.cjs webpack.mix.cjs
COPY --chown=www-data:www-data package.json package.json
#COPY --chown=www-data:www-data server.php server.php
COPY --chown=www-data:www-data phpunit.xml phpunit.xml
COPY --chown=www-data:www-data artisan artisan
COPY --chown=www-data:www-data bootstrap/app.php bootstrap/app.php

# copy the folders
COPY --chown=www-data:www-data public public
COPY --chown=www-data:www-data app app
COPY --chown=www-data:www-data config config
COPY --chown=www-data:www-data database database
COPY --chown=www-data:www-data resources resources
COPY --chown=www-data:www-data routes routes
COPY --chown=www-data:www-data storage storage
COPY --chown=www-data:www-data tests tests
COPY --chown=www-data:www-data vendor vendor

# install php dependencies, and install npm dependencies
RUN mkdir bootstrap/cache && \
    php artisan key:generate --force
    # npm install && \
    # npm run prod
    # TODO: leaving this here to remind us that we need to rework where the APP_KEY is held
    # rm -f .env && \

CMD ["/bin/sh", "-c", "php-fpm","--daemonize", "--fpm-config", "/usr/local/etc/php-fpm.d/www.conf"]
