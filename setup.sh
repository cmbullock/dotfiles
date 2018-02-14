 #!/bin/bash

 mkdir ~/tmp

 touch $HOME/dotfiles/secret.sh

 for FILE in .bash_profile .bashrc .gitconfig .gitignore .tmux.conf .vim .vimrc bash_completion.d; do
   ln -sf $HOME/dotfiles/$FILE $HOME/$FILE
 done

 . ~/dotfiles/.osx
 . ~/dotfiles/.brew
 . ~/dotfiles/.npm

