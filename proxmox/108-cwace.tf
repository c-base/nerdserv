module "cwace" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "cwace"
  vm_id = "108"

  cores  = 4
  memory = 4096

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  disk = {
    // gigabytes
    size    = 32
    storage = var.storage.disk
  }

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["phelix"]
  ]
}
