FROM php:8.4-rc-cli-alpine

# Install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    linux-headers \
    libzip-dev \
    && apk add --no-cache \
    bash \
    curl \
    git \
    openssl-dev \
    zlib-dev

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Clean up build tools to keep image small
RUN apk del -f .build-deps

# Copy custom xdebug config
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Copy Composer from official image
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Set working directory (matches volume mount)
WORKDIR /app