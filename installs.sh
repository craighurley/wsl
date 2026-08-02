#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

echo "${SCRIPT_NAME} starting."

# Ask for the administrator password upfront
sudo -v

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
                    starship \
                    unzip \
                    zsh

# aws cli session manager plugin
curl -sSfL "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash
nvm install node
npm install --omit=dev @commitlint/cli @commitlint/config-conventional
npm install --omit=dev conventional-changelog
npm install --omit=dev lefthook
npm install --omit=dev markdownlint-cli
npm install --omit=dev prettier
npm install --omit=dev shellcheck

# uv
curl -sSfL https://astral.sh/uv/install.sh | sh
~/.local/bin/uv tool install pyright
~/.local/bin/uv tool install ruff

# terraform
curl -sSfL https://releases.hashicorp.com/terraform/1.15.8/terraform_1.15.8_linux_amd64.zip -o "terraform.zip"
unzip terraform.zip terraform ~/.local/bin/
chmod 544 ~/.local/bin/terraform
rm terraform.zip

#
# Env config
#
chsh -s "$(which zsh)"

echo "${SCRIPT_NAME} complete."
