#!/bin/bash

dir=$HOME/.vim/pack/plugins/start/vim-terraform

mkdir -p $dir
git clone https://github.com/hashivim/vim-terraform.git $dir
cp $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
cp $HOME/dotfiles/vimrc $HOME/.vimrc
