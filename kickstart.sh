#! /usr/bin/bash

cd ~

mkdir sources
cd sources

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
yay -S gnome-themes-extra datagrip nvm nerd-fonts-inter code-git

sudo su
pacman -S bluez bluez-utils blueman base-devel nvidia nvidia-utils
systemctl enable bluetooth

pacman -S xorg-server xorg-apps xorg-xinit i3-gaps i3blocks i3lock numlockx i3status ttf-dejavu
pacman -S rxvt-unicode ranger rofi dmenu feh --needed

pacman -S firefox vlc kitty zsh lxappearance vim neovim lazygit ripgrep fd --needed

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

pacman -S 7z gzip unzip
pacman -S php php-cli php-fpm php-cgi php-imagick php-mongodb php-memcache php-redis

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

pacman -S nodejs npm
nvm install node

code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ecmel.vscode-html-css
code --install-extension christian-kohler.npm-intellisense
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension xabikos.JavaScriptSnippets
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension TabNine.tabnine-vscode
code --install-extension ms-vscode.js-debug-nightly
code --install-extension eamodio.gitlens
code --install-extension donjayamanne.jquerysnippets
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension leizongmin.node-module-intellisense
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension xdebug.php-debug
code --install-extension DEVSENSE.phptools-vscode
code --install-extension DEVSENSE.composer-php-vscode
code --install-extension DEVSENSE.profiler-php-vscode
code --install-extension qufiwefefwoyn.inline-sql-syntax
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-complete-tag
code --install-extension BeardedBear.beardedicons
code --install-extension Catppuccin.catppuccin-vsc
code --install-extension ms-azuretools.vscode-docker
code --install-extension christian-kohler.path-intellisense
code --install-extension naumovs.color-highlight
code --install-extension aaron-bond.better-comments
code --install-extension bradlc.vscode-tailwindcss
code --install-extension mikestead.dotenv
code --install-extension wayou.vscode-todo-highlight
code --install-extension Gruntfuggly.todo-tree
code --install-extension usernamehw.errorlens
code --install-extension rangav.vscode-thunder-client
code --install-extension mtxr.sqltools
code --install-extension mtxr.sqltools-driver-pg
code --install-extension mtxr.sqltools-driver-mysql
code --install-extension Oracle.oracledevtools

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

reboot -h now