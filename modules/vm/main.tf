terraform {
  required_providers {
    proxmox = {
      source  = "ForsakenHarmony/proxmox"
      version = "0.0.0-canary.6523af7d"
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
    type  = "host"
    numa  = true
    units = var.weight
  }

  memory {
    dedicated = var.memory
    floating  = min(1024, var.memory)
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

  network_device {
    bridge = var.network.internal_bridge
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

  initialization {
    datastore_id = var.disk.storage

    # this is necessary when using machine type q35 or ovmf bios
    interface = "scsi1"

    user_account {
      password = random_password.default_root_password.result
      keys     = [for _, user in var.admins : user.ssh_key]
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }

      ipv6 {
        address = "dhcp"
      }
    }

    ip_config {
      ipv4 {
        address = "10.23.42.${var.vm_id}/24"
      }
    }
  }
}

resource "proxmox_virtual_environment_acl" "admin_acl" {
  for_each = { for user in var.admins : user.username => user }

  user_id = each.value.username
  role_id = "VMUser"
  path    = "/vms/${proxmox_virtual_environment_vm.vm.vm_id}"
}


resource "random_password" "default_root_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
