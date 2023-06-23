terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  target_node = var.node
  pool        = var.pool

  name = var.name
  iso  = "none"

  cores  = 4
  memory = 8192
  numa   = true

  bios     = "ovmf"
  boot     = "cdn"
  bootdisk = "scsi0"

  # teraform provider is broken and tries to apply every time
  #  machine = "q35"
  qemu_os = "l26"

  agent = var.qemu_agent ? 1 : 0

  oncreate = false
  onboot   = true

  # disable because we don't have an xserver
  tablet = false
  vga {
    type = "std"
  }

  scsihw = "virtio-scsi-single"

  # data disk
  disk {
    size    = var.disk.size
    storage = var.disk.storage

    type = "scsi"

    iothread = 1
    ssd      = 1
    discard  = "on"
  }

  # teraform provider doesn't support this rn
  # efi disk
  #  disk {
  #    size = "4M"
  #    storage = var.disk.storage
  #
  #    type = "efidisk"
  #  }

  network {
    model  = "virtio"
    bridge = var.network.bridge
  }
}
