#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

rm ~/.bashrc -f
ln -s ~/dotfiles/.bashrc ~

rm ~/.bash_aliases -f
ln -s ~/dotfiles/.bash_aliases ~


# git
rm ~/.gitconfig -f
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
# Create local config if missing
if [[ ! -f "$CONFIG_DIR/gitconfig.local" ]]; then
    mkdir -p "$CONFIG_DIR/git"
    cp -r "$DOTFILES/git/gitconfig.local.example" "$CONFIG_DIR/git/gitconfig.local"

    echo
    echo "👉 Edit your git identity:"
    echo "   ${EDITOR:-nano} $CONFIG_DIR/gitconfig.local"
fi

echo "Git configured."


rm ~/.vimrc -f
ln -s ~/dotfiles/.vimrc ~

rm ~/.tmux.conf -f
ln -s ~/dotfiles/.tmux.conf ~

rm ~/.zshrc -f
ln -s ~/dotfiles/.zshrc ~
