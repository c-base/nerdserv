module "kristall-miai_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name = "kristall-miai"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 6
  memory = 36864

  disk = {
    // gigabytes
    size    = 15
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
  }

  ssh_keys = [
    var.users["kristall"].ssh_key,
  ]
}
