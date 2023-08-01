terraform {
  required_providers {
    proxmox = {
      source  = "ForsakenHarmony/proxmox"
      version = "0.0.0-canary.18"
    }
  }
}

resource "proxmox_virtual_environment_container" "container" {
  node_name = var.node
  pool_id   = var.pool

  description = "Managed by Terraform"

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.disk.storage
    size         = var.disk.size
  }

  mount_point {
    path   = "/data"
    volume = "/datapool/config/container/docker"
  }

  initialization {
    hostname = var.name

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys     = var.ssh_keys
      password = random_password.container_password.result
    }
  }

  network_interface {
    name = var.network.bridge
  }

  operating_system {
    template_file_id = var.operating_system.template_file_id
    type             = var.operating_system.type
  }

  unprivileged = true
  features {
    nesting = true
  }
}

resource "random_password" "container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
