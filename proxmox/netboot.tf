module "netboot_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name = "netboot"
  vm_id = "102"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 1
  memory = 2048

  disk = {
    // gigabytes
    size    = 48
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  ssh_keys = [
    var.users["saces"].ssh_key,
  ]
}
