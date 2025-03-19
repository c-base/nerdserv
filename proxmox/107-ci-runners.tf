module "ci_runners_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "ci-runners"
  vm_id = "107"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 4
  memory = 4096
  weight = 128

  disks = [{
    size_gb = 32
    storage = var.storage.disk
  }]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["saces"]
  ]
}
