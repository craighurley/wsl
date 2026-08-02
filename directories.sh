#!/usr/bin/env bash

# Start
echo "$(basename "$0") starting."

# ssh
[[ ! -d ~/.ssh ]] && mkdir -p ~/.ssh && chmod 700 ~/.ssh
[[ ! -f ~/.ssh/authorized_keys ]] && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

# create folders
[[ ! -d ~/.config ]] && mkdir -p ~/.config
[[ ! -d ~/.local/bin ]] && mkdir -p ~/.local/bin
[[ ! -d ~/backups ]] && mkdir -p ~/backups
[[ ! -d ~/tmp ]] && mkdir -p ~/tmp

# Finished
echo "$(basename "$0") complete."
