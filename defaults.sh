#!/bin/sh

# Credit where credit is due: https://github.com/robb/.dotfiles

# Disable the new window animation - every new window grows
# from a small one to a big one over a few hundred millisecs
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Use AirDrop over every network interface and on unsupported Macs.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default.
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Don't create dreaded .DS_Store files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set keyboard repeat rate to "damn fast".
defaults write NSGlobalDomain KeyRepeat -int 0

# Set a shorter delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Move Dock to the right
defaults write com.apple.dock orientation -string "right"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable sound effects when changing volume
defaults write -g com.apple.sound.beep.feedback -integer 0

# Show the status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show absolute path in Finder's title bar.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
