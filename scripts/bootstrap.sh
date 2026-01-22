#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/.config"

# Symlink ~/.config/*
for dir in "$DOTFILES_DIR/config/"*; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  target="$HOME/.config/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing $target -> $target.bak"
    mv "$target" "$target.bak"
  fi
  ln -snf "$dir" "$target"
  echo "Linked $target"
done

# Symlink ~/.* files from home/
for file in "$DOTFILES_DIR/home/"*; do
  [ -e "$file" ] || continue
  name="$(basename "$file")"
  target="$HOME/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing $target -> $target.bak"
    mv "$target" "$target.bak"
  fi
  ln -snf "$file" "$target"
  echo "Linked $target"
done

echo "Done."
echo "Next (optional): brew bundle --file \"$DOTFILES_DIR/Brewfile\""
