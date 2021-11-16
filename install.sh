#!/bin/bash

echo "Installing deps"
yes | sudo pacman -S --needed neovim zsh git kitty base-devel

cd "$(dirname "$0")"
echo "Installing ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

for dir in */
do
    dir=${dir%*/}
    echo "> Now stowing: ${dir##*/}"
    stow ${dir##*/}
done
