#!/bin/sh
DIR=$(cd $(dirname $0) && pwd)
cd $DIR
git submodule update --init
for F in .profile .bashrc .bash_aliases .gitconfig .vim .vimrc .tmux.conf
do
  echo "ln -s $DIR/dot$F $HOME/$F"
  ln -s $DIR/dot$F $HOME/$F
done
