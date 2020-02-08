#!/bin/sh
echo "Configuring alias"
rm $HOME/.aliases
ln -s $HOME/.dotfiles/.aliases $HOME/.aliases

echo "Configuring vim"

mkdir $HOME/.dotfiles/.vim/colors

# Symlink the .vim folder and .vimrc file from the .dotfiles
rm -rf $HOME/.dotfiles/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.dotfiles/.vim/bundle/Vundle.vim

# Install atom-dark-256 theme
wget -O $HOME/.dotfiles/.vim/colors/atom-dark-256.vim https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim

# Symlink .vim folder
rm -rf $HOME/.vim
ln -s $HOME/.dotfiles/.vim $HOME/.vim

# Symlink .vimrc folder
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

# Symlink .vimrc folder
vim +PluginInstall +qall
