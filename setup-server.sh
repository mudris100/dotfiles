#!/usr/bin/env bash

TARGET_FILE="$HOME/.bashrc"
dir=$HOME/.vim/pack/plugins/start/vim-terraform
bashrc_dir=$HOME/.bashrc.d
src=$HOME/dotfiles
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

mkdir -p $dir $bashrc_dir
cp -r $src/bashrc.d/. $HOME/.bashrc.d
git clone https://github.com/hashivim/vim-terraform.git $dir
cp $src/tmux/tmux-server.conf $HOME/.tmux.conf
cp $src/vim/vimrc $HOME/.vimrc
cp -r $src/vim/colors $HOME/.vim

# The Fedora bashrc.d block to append
read -r -d '' BASHRC_BLOCK << 'EOF'

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
EOF

# Check if ~/.bashrc exists
if [ ! -f "$TARGET_FILE" ]; then
    touch "$TARGET_FILE"
fi

# Check if the block is already present to prevent duplication
if grep -q "\~/.bashrc.d" "$TARGET_FILE"; then
    echo "Notice: The .bashrc.d configuration already exists in $TARGET_FILE. Skipping."
else
    echo "Adding .bashrc.d support to $TARGET_FILE..."
    printf "%s\n" "$BASHRC_BLOCK" >> "$TARGET_FILE"
    echo "Successfully updated $TARGET_FILE."
fi
