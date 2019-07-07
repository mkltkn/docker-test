FROM php:7.2.19-fpm

ARG APP_DIR=wBackend
RUN mkdir =p /home/${APP_DIR}
WORKDIR /home/${APP_DIR}

COPY . ${APP_DIR}

RUN apt-get update -y \
  && apt-get install -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- \
      --install-dir=/usr/local/bin \
      --filename=composer \
      --version=1.8.6

RUN php artisan serve