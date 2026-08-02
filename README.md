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

`cd` into the cloned repo and run the following scripts:

```
directories.sh
installs.sh
dotfiles.sh
```
