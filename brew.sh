#!/bin/bash

# Install if not already present
hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update everything
brew update
brew upgrade

# Binary only stuff
brew cask install iterm2
brew cask install virtualbox
brew cask install vagrant
brew cask install slack
brew cask install flux

# Outdated apple stuff
brew install coreutils
brew install findutils
brew install bash

# Must-haves
brew install vim
brew install wget --enable-iri
brew install git
brew install the_silver_searcher
brew install jq
brew install openssl
brew install pcre
brew install rlwrap
brew install tree
brew install tmux
brew install unrar
brew install yarn
brew install docker-compose
brew install awscli

# Cleanup
brew cleanup

