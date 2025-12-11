#!/bin/bash
set -e

# Replace the port in nginx config
echo "Configuring Nginx port to $PORT..."
sed -i "s/8080/$PORT/g" /etc/nginx/conf.d/default.conf

# Try to migrate, but don't stop if it fails
echo "Running migrations..."
php artisan migrate --force || echo "⚠️ Migration failed! Skipping..."

# Start Nginx in the background
echo "Starting Nginx..."
service nginx start

# Start PHP-FPM in the foreground
echo "Starting PHP-FPM..."
php-fpm
