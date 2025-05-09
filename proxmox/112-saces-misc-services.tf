module "saces_misc_services_vm" {
  source = "../modules/vm"
  node   = var.node
  pool   = var.pool

  name  = "saces-misc-services"
  vm_id = "112"

  clone = data.proxmox_virtual_environment_vm.debian_cloud_vm_template.vm_id

  cores  = 2
  memory = 2049

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
