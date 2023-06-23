# Server Setup Information

## Scripts

### Post Install

Source: https://github.com/tteck/Proxmox/blob/d8b78777752f8727bc64b0f256b62633934741fa/misc/post-pve-install.sh

- disables Enterprise Repo
- adds no-subscription & test repos
- disables subscription nag

## Config

`/etc/apt/sources.list`
```list
deb http://ftp.debian.org/debian bullseye main contrib non-free
deb http://ftp.debian.org/debian bullseye-updates main contrib non-free
deb http://security.debian.org/debian-security bullseye-security main contrib non-free

# newer package versions
deb http://ftp.debian.org/debian bullseye-backports main contrib non-free

# up to date intel-microcode
deb http://ftp.debian.org/debian bookworm non-free-firmware
```
