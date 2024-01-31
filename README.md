# nerdserv IaC

Configuration for all VMs / Containers running on nerdserv using Terraform

## How to get a (debian) VM

1. Add your ssh key to `locals.tf` in the root of the directory.
    ```tf
    locals {
      users = {
        // ... snip ...
        your_membername = {
          ssh_key = "your ssh-key here"
        }
      }
      // ... snip ...
    }
    ```
2. Create a new file in the `proxmox` directory named `{your_vm_name}.tf`
    ```tf
    module "<your_vm_name>_vm" {
      source = "../modules/vm"
      node   = var.node
      pool   = var.pool

      name  = "docker"
      vm_id = "<this needs to be the next free vm_id>"

      clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

      cores  = <how many (virtual) cores you need>
      memory = <how much memory you need in MB>

      disk = {
        // gigabytes
        size    = <how much storage you need in GB>
        storage = var.storage.disk
      }

      network = {
        bridge          = var.network.bridge
        internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
      }

      admins = [
        local.users["your_membername"]
      ]
    }
    ```
