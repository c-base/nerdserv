module "netboot_vm" {
  source = "../modules/vm"

  name = "netboot"
  node = var.node

  # teraform provider is broken and tries to apply every time
  # pool = local.pool

  qemu_agent = true

  cores  = 1
  memory = 2048

  disk = {
    // gigabytes
    size    = 48
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
  }

  ssh_keys = [
    var.users["saces"].ssh_key
  ]
}
