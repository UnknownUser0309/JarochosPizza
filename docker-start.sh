#!/bin/bash
set -e

# Replace the port in nginx config
echo "Configuring Nginx port to $PORT..."
sed -i "s/8080/$PORT/g" /etc/nginx/conf.d/default.conf

# Validating files
echo "Checking index.php..."
ls -l /var/www/html/public/index.php

# Tail Nginx error logs to stdout so we can see them in Railway
# This is crucial for debugging 502 errors
touch /var/log/nginx/error.log
tail -f /var/log/nginx/error.log &

# Try to migrate, but don't stop if it fails
echo "Running migrations..."
php artisan migrate --force || echo "⚠️ Migration failed! Skipping..."

# Start Nginx
echo "Starting Nginx..."
service nginx start

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm
