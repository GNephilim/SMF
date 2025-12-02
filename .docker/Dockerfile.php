FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    curl \
    git \
    mysql-client \
    postgresql-client \
    bash \
    zip \
    unzip \
    libzip-dev \
    icu-dev \
    zlib-dev \
    oniguruma-dev

# Install PHP extensions required by SMF
RUN docker-php-ext-install \
    pdo_mysql \
    pdo_pgsql \
    mysqli \
    mbstring \
    fileinfo \
    intl \
    zip \
    opcache

# Configure opcache for better performance
RUN docker-php-ext-enable opcache

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Create a non-root user for PHP-FPM
RUN addgroup -g 1000 smf && adduser -D -u 1000 -G smf smf

# Set proper permissions
RUN chown -R smf:smf /var/www/html

# Switch to the smf user
USER smf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
