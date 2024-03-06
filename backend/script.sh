#!/bin/bash

# Update package lists
sudo apt update 


sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "The page was created by the user data" | sudo tee /var/www/html/index.html


# Install PHP and its dependencies
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y

# Install Composer
sudo apt install composer -y

# Install Laravel globally
composer global require laravel/installer

# Add Composer global bin directory to PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Source .bashrc to update PATH
source ~/.bashrc
