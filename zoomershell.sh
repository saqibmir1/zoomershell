#!/bin/sh

echo "Welcome to ZoomerShell Script"
echo "This script install configs and packages that i use for the zsh"
echo "press ENTER to continue to ctrl+c to cancel"
read

#install packages
echo "Installing required packages"
sudo pacman -Sy zsh zsh-syntax-highlighting curl wget --noconfirm --needed

#make dirs if not present
echo "Making requred directories if not present"
[ -d "$HOME/.local/bin" ] || mkdir -p $HOME/.local/bin
[ -d "$HOME/.config/shell" ] || mkdir -p $HOME/.config/shell
mkdir -p $HOME/.cache/zsh

#get files from the net
echo "downloading .zshrc"
curl https://raw.githubusercontent.com/saqibmir1/dotfiles/master/.zshrc > ~/.zshrc
echo "downloading aliasrc"
curl https://raw.githubusercontent.com/saqibmir1/dotfiles/master/.config/shell/aliasrc > ~/.config/shell/aliasrc
echo "downloading fm6000 for ascii art"
curl https://raw.githubusercontent.com/saqibmir1/dotfiles/master/.local/bin/fm6000
echo "downloading bash.command not found script for insults"
sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found

#finally chsh
ehco "finally making zsh default shell"
sudo chsh -s $(which zsh)

echo "NOW LOGOUT AND LOGIN AGAIN TO START USING ZSH"
