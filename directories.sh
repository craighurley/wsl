#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

echo "${SCRIPT_NAME} starting."

# ssh
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh && chmod 700 ~/.ssh
[[ ! -f ~/.ssh/authorized_keys ]] && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

# create folders
[[ ! -d ~/.config ]] && mkdir -p ~/.config
[[ ! -d ~/.local/bin ]] && mkdir -p ~/.local/bin
[[ ! -d ~/backups/dotfiles ]] && mkdir -p ~/backups/dotfiles
[[ ! -d ~/node_modules/.bin ]] && mkdir -p ~/node_modules/.bin
[[ ! -d ~/projects ]] && mkdir -p ~/projects
[[ ! -d ~/tmp ]] && mkdir -p ~/tmp

echo "${SCRIPT_NAME} complete."
