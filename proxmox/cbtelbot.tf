module "netboot_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "cbtelbot"
  vm_id = "104"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 1
  memory = 1024

  disk = {
    // gigabytes
    size    = 48
    storage = var.storage.disk
  }

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["uk"]
  ]
}
