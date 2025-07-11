#!/bin/sh

#Install xcode
xcode-select –install

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo mkdir -p /usr/local/bin
echo 'PATH="/usr/local/bin:$PATH"' >> $HOME/.zprofile
brew install zsh-autosuggestions
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> $HOME/.zshrc


#Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono
brew install coreutils

# Tools...
brew install git
brew install telnet
brew install jq
brew install awscli
brew install tree
brew install ack
brew install tmux
brew install bash # latest bash version
brew install htop
brew install --cask clipy

# Terminals
brew install --cask termius
brew install --cask alacritty

# Code editors
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask zed
brew install --cask windsurf

brew install --cask obsidian
brew install anki

# vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Programming related...
brew install nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Install node
nvm install --lts

# Install bun
curl -fsSL https://bun.sh/install | bash

# Install pnpm
brew install pnpm

# Install golang
brew install golang

# Install miniconda
brew install --cask miniconda
conda init

# Install postgres
brew install postgres

# Install mysql
brew install mysql
brew install --cask sequel-pro


# Install docker and kubernetes
brew install --cask docker
brew install kubectl

brew install --cask sequel-ace
brew install --cask tableplus


brew install openjdk
echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
brew install openjdk@21


brew install --cask mongodb-compass

brew install --cask postman

# Install outline VPN
brew install --cask outline-manager
echo "You have to install outline yourself. Coz, they are not allowing."

# Search better
brew install --cask alfred
# set command space as alfred


# Install browsers
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox

# Essential softwares
brew install --cask telegram
brew install --cask whatsapp
brew install --cask lark
brew install --cask slack
brew install --cask zoom
brew install --cask claude
brew install --cask chatgpt
brew install --cask lm-studio
brew install --cask superwhisper
brew install --cask rectangle
brew install --cask caffeine
brew install --cask notion
brew install --cask rescuetime
brew install --cask obs
brew install tailscale && sudo tailscaled install-system-daemon
brew install infisical/get-cli/infisical
brew install supabase/tap/supabase


npm install -g tldr
brew install google-cloud-sdk

brew install gh
git clone git@github.com:setkyar/bin.git ~/bin
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
touch ~/bin/llm.env

mkdir $HOME/work
mkdir $HOME/explore-code

# ask user to provide ssh private key and public key
echo "Please provide your ssh private key"
private_key=$(cat)
echo "Please provide your ssh public key"
public_key=$(cat)

# create ssh folder
mkdir $HOME/.ssh
echo $private_key > $HOME/.ssh/id_rsa
echo $public_key > $HOME/.ssh/id_rsa.pub

chmod 600 $HOME/.ssh/id_rsa
chmod 644 $HOME/.ssh/id_rsa.pub

# ask user to provide git username and email
echo "Please provide your git username"
git_username=$(cat)
echo "Please provide your git email"
git_email=$(cat)

git config --global user.name $git_username
git config --global user.email $git_email