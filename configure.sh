#!/bin/sh

#Install xcode
xcode-select –install

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo mkdir /usr/local/bin
echo 'PATH="/usr/local/bin:$PATH"' >> /Users/universe/.zprofile

#Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/universe/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/universe/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono

# Tools...
brew install git
brew install telnet
brew install jq
brew install awscli
brew install tree
brew install ack
brew install tmux
brew install bash # latest bash version

# Terminals
brew install --cask termius
brew install --cask alacritty

# Code editors
brew install --cask visual-studio-code
brew install --cask sublime-text

# Programming related...
brew install nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Install node
nvm install --lts

# Install golang
brew install golang

# Install miniconda
brew install --cask miniconda
conda init
source /Users/universe/.bash_profile

# Install postgres
brew install postgres

# Install mysql
brew install mysql
brew install --cask sequel-pro

# Install docker and kubernetes
brew install docker
brew install kubectl

brew install --cask tableplus

# Install browsers
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox

# Essential softwares
brew install --cask telegram
brew install --cask spectacle
brew install --cask caffeine

# move Spectacle shortcuts
mv dots/Shortcuts.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

# Documencation tools
npm install -g tldr

curl -o ask https://github.com/setkyar/ask/releases/download/v1.0.0/ask-darwin-amd64-1.0.0
sudo chmod +x ask
sudo mv ask /usr/local/bin

mkdir $HOME/work
mkdir $HOME/explore-code