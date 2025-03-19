module "kristall-miai_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "kristall-miai"
  vm_id = "103"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 6
  memory = 36864

  disks = [{
    size_gb = 15
    storage = var.storage.disk
  }]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["kristall"]
  ]
}
