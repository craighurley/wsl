# WSL Setup

## Ubuntu

To install Ubuntu in WSL, run the following command in PowerShell and follow the installation prompts:

```
wsl --install -d Ubuntu
```

Open a WSL terminal and clone this repo:

```
cd ~
git clone https://github.com/craighurley/wsl.git
```

Run the following scripts:

```
~/wsl/directories.sh
~/wsl/installs.sh
~/wsl/dotfiles.sh
```

The default timezone is UTC, you may want to change that to your region:

```
# for Melbourne:
sudo timedatectl set-timezone Australia/Melbourne
# or for Auckland:
sudo timedatectl set-timezone Pacific/Auckland
```
