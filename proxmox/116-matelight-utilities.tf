module "matelight_utilities_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "matelight_utilities"
  vm_id = "116"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 2
  memory = 2048

  disks = [{
    size_gb = 32
    storage = var.storage.disk
  }]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["abe"]
  ]
}
