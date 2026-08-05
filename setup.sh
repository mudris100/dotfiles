#!/bin/bash

dir=$HOME/.vim/pack/plugins/start/vim-terraform

# Previous files/directories to clean up from $HOME
LEGACY_PATHS=(
  "$HOME/.vimrc"
  "$HOME/.vim"
  "$HOME/.tmux.conf"
)

echo "Cleaning up dotfiles..."
for path in "${LEGACY_PATHS[@]}"; do
  if [ -e "$path" ] || [ -L "$path" ]; then
    rm -rf "$path"
    echo "  Removed: $path"
  fi
done

mkdir -p $dir
git clone https://github.com/hashivim/vim-terraform.git $dir
cp $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
cp $HOME/dotfiles/vimrc $HOME/.vimrc
cp -r $HOME/dotfiles/vim/colors $HOME/.vim
