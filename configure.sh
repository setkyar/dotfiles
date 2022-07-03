#!/bin/sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
brew install --cask termius
brew install --cask alacritty

# Code editors
brew install --cask visual-studio-code
brew install --cask sublime-text

# Programming related...
brew install nvm

# Brosers...
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
