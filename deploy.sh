#!/bin/bash
set -e

echo "🚀 Deploy shuru..."

cd /var/www/html/myapp

# Latest code lo
git pull origin main

# Composer dependencies
composer install --no-dev --optimize-autoloader

# NPM build (agar frontend hai)
npm install
npm run build

# Laravel commands
php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Permissions fix
sudo chown -R www-data:www-data /var/www/html/myapp
sudo chmod -R 775 storage bootstrap/cache

echo "✅ Deploy complete!"
