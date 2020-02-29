#!/bin/bash

php artisan migrate
php artisan key:generate
php artisan config:cache
php-fpm
