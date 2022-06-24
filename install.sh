#!/bin/bash

# Get absolute path to dotfiles dir
pushd "$(dirname "$0")" || exit 1 > /dev/null
DOTFILES_DIR=$(pwd -L)
popd || exit 1 > /dev/null

link() {
  ln_source="$DOTFILES_DIR/$1"
  ln_target="$HOME/$2"
  if [ -L "$ln_target" ]
  then
    echo "[Skipping] $ln_source -> $ln_target, target symlink already exists"
  else
    echo "[Installing] $ln_source -> $ln_target"
    ln -sf "$ln_source" "$ln_target"
  fi
}

# Zsh
link zsh/zsh-plugins .zsh-plugins
link zsh/zshrc .zshrc

#Git
link git/gitconfig/gitconfig .gitconfig
