#!/bin/bash
set -e

export HOME=/home/ahmad
export GIT_SSH_COMMAND="ssh -i /home/ahmad/.ssh/id_ed25519 -p 443 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

echo "🚀 Deploy shuru..."

cd /var/www/html/myapp

git pull origin main

php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "✅ Deploy complete!"