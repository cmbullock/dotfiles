#!/bin/bash
 
if [[ ! -d .nvm ]]; then
  cd $HOME && git clone https://github.com/creationix/nvm.git .nvm
  cd $HOME/.nvm && git checkout v0.33.8
  . nvm.sh
  nvm install --lts
fi

