# cloud-init setup

IMPORTANT: if using UEFI bios or machine type q35 the cloud-init drive needs to be mounted as scsi

## Prerequisites

```bash
apt install libguestfs-tools
```

## debian

```bash
# download latest debian cloud-init image
wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2

# add qemu agent for proxmox integration
virt-customize -a debian-12-genericcloud-amd64.qcow2 --install qemu-guest-agent

# import the disk to a template VM
qm importdisk 9000 debian-12-genericcloud-amd64.qcow2 data
```
