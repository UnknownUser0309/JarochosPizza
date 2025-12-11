FROM php:8.2-fpm

# Install system dependencies (including Node.js for frontend build)
RUN apt-get update && apt-get install -y \
    nginx \
    zip unzip \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd exif pcntl bcmath

# Get Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy project files with correct permissions
COPY --chown=www-data:www-data . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Install Frontend dependencies and Build (Vite)
RUN npm install && npm run build

# Set permissions for the whole project to avoid permission denied in Nginx/PHP
RUN chown -R www-data:www-data /var/www/html

# Configure Nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Configure PHP-FPM (Force Port 9000)
COPY ./zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf

# Copy startup script
COPY ./docker-start.sh /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

# Expose port (Force 8000 as requested)
EXPOSE 8000

# Start using the script
CMD ["start-container"]
