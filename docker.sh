#!/usr/bin/env bash

set -euo pipefail

SCRIPT_NAME="$(basename "$0")"

echo "${SCRIPT_NAME} starting."

# Ask for the administrator password upfront
sudo -v

# Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates \
                    curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to apt sources:
# shellcheck disable=SC1091
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update

# Install Docker
sudo apt install -y docker-ce \
                    docker-ce-cli \
                    containerd.io \
                    docker-buildx-plugin \
                    docker-compose-plugin

# Check if docker is running
systemctl is-active docker

# Add the current user to the docker group
sudo usermod -aG docker "$USER"

echo "${SCRIPT_NAME} complete."
