#!/bin/bash
set -e

export HOME=/home/ahmad
export GIT_SSH_COMMAND="ssh -i /home/ahmad/.ssh/id_ed25519 -o StrictHostKeyChecking=no"

echo "🚀 Deploy shuru..."

cd /var/www/html/myapp

# Main branch se latest code lo
git pull origin main

php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "✅ Deploy complete!"