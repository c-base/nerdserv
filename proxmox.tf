provider "proxmox" {
  endpoint = "https://nerdserv.cbrp3.c-base.org:8006"
  insecure = true

  api_token = format("%s=%s", var.pm_token.id, var.pm_token.secret)
}

module "home_assistant_vm" {
  source = "./modules/vm"

  name = "home-assistant"
  node = local.node

  # teraform provider is broken and tries to apply every time
  # pool = local.pool

  qemu_agent = true

  cores  = 4
  memory = 8192

  disk = {
    // gigabytes
    size    = 64
    storage = local.storage.disk
  }

  network = {
    bridge = local.network.bridge
  }
}
