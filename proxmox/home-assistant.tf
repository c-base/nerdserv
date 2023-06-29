module "home_assistant_vm" {
  source = "../modules/vm"

  name = "home-assistant"
  node = var.node

  # teraform provider is broken and tries to apply every time
  # pool = local.pool

  qemu_agent = true

  cores  = 4
  memory = 8192

  disk = {
    // gigabytes
    size    = 64
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
  }
}
