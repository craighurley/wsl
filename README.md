# WSL Setup

## Ubuntu

To install Ubuntu in WSL, run the following command in _PowerShell_ and follow the installation prompts:

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

### Timezone

The default timezone is UTC, you may want to change that to your region:

```
# for Melbourne:
sudo timedatectl set-timezone Australia/Melbourne
# or for Auckland:
sudo timedatectl set-timezone Pacific/Auckland
```

### git committer

You'll need to update your git committer details:

```
cp ~/.gitconfig.custom.example ~/.gitconfig.custom
# now edit your name and email address in ~/.gitconfig.custom
```

### SSH

Generate your SSH key:

```
ssh-keygen -f ~/.ssh/$USER -C "$USER@$HOSTNAME"
```

### Docker

If you need to install docker, run this within WSL:

```
~/wsl/docker.sh
```

Once that completes successfully, shutdown WSL from _PowerShell_:

```
wsl --shutdown
```

Now open a new terminal for Ubuntu and Docker will be ready to use.
