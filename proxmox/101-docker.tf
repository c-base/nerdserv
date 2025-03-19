module "docker_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "docker"
  vm_id = "101"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 4
  memory = 8192

  disks = [{
    size_gb = 64
    storage = var.storage.disk
  }]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["hrmny"]
  ]
}
