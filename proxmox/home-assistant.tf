module "home_assistant_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name = "home-assistant"
  vm_id = "100"

  cores  = 4
  memory = 8192

  disk = {
    // gigabytes
    size    = 64
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }
}
