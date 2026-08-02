#!/usr/bin/env bash

# Start
echo "$(basename "$0") starting."

# Ask for the administrator password upfront
sudo -v

#
# Installs
#

# apt
sudo apt update
sudo apt upgrade -y
sudo apt install -y awscli \
                    bzip2 \
                    diffr \
                    direnv \
                    gitleaks \
                    hurl \
                    make \
                    ncat \
                    nodejs \
                    npm \
                    starship \
                    unzip \
                    zsh

# aws cli session manager plugin
curl -sSfL "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# npm
sudo npm install --omit=dev @commitlint/cli @commitlint/config-conventional
sudo npm install --omit=dev conventional-changelog
sudo npm install --omit=dev lefthook
sudo npm install --omit=dev markdownlint-cli
sudo npm install --omit=dev prettier
sudo npm install --omit=dev pyright
sudo npm install --omit=dev shellcheck

# uv
curl -sSfL https://astral.sh/uv/install.sh | sh
~/.local/bin/uv tool install ruff

#
# Env config
#
chsh -s "$(which zsh)"

# Finished
echo "$(basename "$0") complete."
