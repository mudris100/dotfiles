#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="$HOME/git-hub/dotfiles"
ALACRITTY_DIR="$HOME/.config/alacritty"
VIM_DIR="$HOME/.config/vim"
TMUX_DIR="$HOME/.config/tmux"

# Legacy files/directories to clean up from $HOME
LEGACY_PATHS=(
  "$HOME/.vimrc"
  "$HOME/.vim"
  "$HOME/.tmux.conf"
  "$HOME/.alacritty.toml"
)

echo "Cleaning up legacy dotfiles..."
for path in "${LEGACY_PATHS[@]}"; do
  if [ -e "$path" ] || [ -L "$path" ]; then
    rm -rf "$path"
    echo "  Removed: $path"
  fi
done

echo "Creating target directories..."
mkdir -p "$ALACRITTY_DIR" "$VIM_DIR" "$TMUX_DIR"

echo "Linking dotfiles..."
ln -sfn "$TARGET_DIR/alacritty/alacritty.toml"    "$ALACRITTY_DIR/alacritty.toml"
ln -sfn "$TARGET_DIR/vim/vimrc"                   "$VIM_DIR/vimrc"
ln -sfn "$TARGET_DIR/vim/colors"                  "$VIM_DIR/colors"
ln -sfn "$TARGET_DIR/tmux/tmux-workstation.conf"  "$TMUX_DIR/tmux.conf"

echo "Dotfiles linked successfully!"
