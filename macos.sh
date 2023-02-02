#!/usr/bin/env bash

# More to learn from the following repo
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write -g InitialKeyRepeat -int 15 #sets the key repeat rate to the fastest
defaults write -g KeyRepeat -int 2 #sets the delay until repeat to the shortest