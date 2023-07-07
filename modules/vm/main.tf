terraform {
  required_providers {
    proxmox = {
      source  = "ForsakenHarmony/proxmox"
      version = "0.0.0-canary.16"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  node_name = var.node
  pool_id   = var.pool

  vm_id    = var.vm_id
  template = var.template

  name = var.name

  cpu {
    cores = var.cores
    // "x86-64-v2-AES" is best if live migration is needed
    type = "host"
    numa = true
  }

  memory {
    dedicated = var.memory
  }

  bios       = "ovmf"
  boot_order = ["scsi0"]

  machine = "q35"
  operating_system {
    type = "l26"
  }

  agent {
    enabled = var.qemu_agent
    trim    = true
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
    type         = "4m"
  }

  network_device {
    bridge = var.network.bridge
    model  = "virtio"
  }

  started = var.started

  dynamic "clone" {
    for_each = var.clone != null ? [var.clone] : []
    content {
      datastore_id = var.disk.storage
      vm_id        = clone.value
    }
  }

  dynamic "initialization" {
    for_each = var.ssh_keys != null ? [var.ssh_keys] : []
    content {
      datastore_id = var.disk.storage

      # this is necessary when using machine type q35 or ovmf bios
      interface    = "scsi1"

      user_account {
        password = random_password.default_root_password.result
        keys     = initialization.value
      }

      ip_config {
        ipv4 {
          address = "dhcp"
        }

        ipv6 {
          address = "dhcp"
        }
      }
    }
  }
}

resource "random_password" "default_root_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
