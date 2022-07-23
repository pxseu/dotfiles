#!/bin/bash

echo "Installing deps"
yes | sudo pacman -S --needed neovim zsh git kitty base-devel yarn python3 htop gnome-keyring keepassxc

cd "$(dirname "$0")"
echo "Installing ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo "Installing VIM-PLUG"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

echo "Installing YAY packages"
yay -S code-insiders google-chrome-dev spotify discord-canary discord-canary-update-skip-git authy  --noconfirm

discord-canary-update-skip

echo "Installing Fonts"
yay -S noto-fonts-emoji ttf-fira-code ttf-meslo-nerd-font-powerlevel10k

echo "Updating shell"
sudo chsh $USER --shell /bin/zsh
