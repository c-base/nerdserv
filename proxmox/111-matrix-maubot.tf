module "matrix_maubot_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "matrix-maubot"
  vm_id = "111"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 4
  memory = 8192

  disks = [
    {
      size_gb = 32
      storage = var.storage.disk
    },
    {
      size_gb = 128
      storage = var.storage.disk
    },
  ]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  admins = [
    local.users["saces"]
  ]
}
