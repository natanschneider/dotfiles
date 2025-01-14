#!/bin/bash

cd ~

sudo su
pacman -S bluez bluez-utils blueman base-devel nvidia nvidia-utils
systemctl enable bluetooth

pacman -S firefox vlc kitty zsh lxappearance tmux vim neovim lazygit ripgrep fd --needed

pacman -S hyprland egl-wayland xdg-desktop-portal-hyprland hyprpaper hypridle hyprlock wofi uwsm thunar

mkdir sources
cd sources

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
yay -S gnome-themes-extra datagrip nvm nerd-fonts-inter code-git iwgtk

pacman -S 7z gzip unzip
pacman -S php php-cli php-fpm php-cgi php-imagick php-memcache php-redis

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

pacman -S nodejs npm
nvm install node

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

