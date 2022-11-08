#!/bin/bash

BASEDIR=$(dirname $(realpath "$0"))

yes Y | apt-get update
yes Y | apt-get install make
yes Y | apt-get install gcc
yes Y | apt-get install clang
yes Y | apt-get install fzf
yes Y | apt-get install ripgrep
yes Y | apt-get install fonts-powerline
yes Y | apt-get install zsh-autosuggestions
yes Y | apt-get install zsh-syntax-highlighting
yes Y | apt-get install zsh
yes Y | apt-get install tmux

sudo snap install nvim --classic

cd /
mkdir /home/root/
mkdir /home/root/.config

cp -r $BASEDIR/nvim /home/root/.config/nvim/


chsh -s $(which zsh)

no N | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i 's/robbyrussell/powerlevel10k\/powerlevel10k/' /root/.zshrc


echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

zsh