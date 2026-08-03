#!/usr/bin/env bash

set -euo pipefail

SCRIPT_NAME="$(basename "$0")"
NVM_VERSION="0.40.6"
TERRAFORM_VERSION="1.15.8"

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
                    jq \
                    make \
                    ncat \
                    starship \
                    unzip \
                    zsh

# aws cli session manager plugin
curl -sSfL "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
rm session-manager-plugin.deb

# npm
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install node

npm install --omit=dev @commitlint/cli @commitlint/config-conventional
npm install --omit=dev @github/copilot
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
curl -sSfL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "terraform.zip"
unzip terraform.zip terraform -d ~/.local/bin/
chmod 544 ~/.local/bin/terraform
rm terraform.zip

#
# Env config
#
echo "${SCRIPT_NAME} setting default shell to zsh..."
chsh -s "$(which zsh)"

echo "${SCRIPT_NAME} complete."
