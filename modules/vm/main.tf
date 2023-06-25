terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.21.1"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  node_name = var.node
  pool_id   = var.pool

  name = var.name
  #  iso  = "none"

  cpu {
    cores = 4
    type  = "host"
    numa  = true
  }

  memory {
    dedicated = 8192
  }

  bios       = "ovmf"
  boot_order = ["scsi0"]

  machine = "q35"
  operating_system {
    type = "l26"
  }

  agent {
    enabled = true
  }

  on_boot = true

  # disable because we don't have an xserver
  tablet_device = false
  vga {
    enabled = true
    type    = "std"
  }

  scsi_hardware = "virtio-scsi-single"

  # data disk
  disk {
    size         = var.disk.size
    datastore_id = var.disk.storage

    file_format = "raw"

    interface = "scsi0"

    iothread = true
    ssd      = true
    discard  = "on"
  }

  # efi disk
  efi_disk {
    datastore_id = var.disk.storage
    size         = "1M"
  }

  network_device {
    bridge = var.network.bridge
    model  = "virtio"
  }
}
