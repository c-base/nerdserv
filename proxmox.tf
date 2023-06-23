provider "proxmox" {
  pm_api_url      = "https://nerdserv.cbrp3.c-base.org:8006/api2/json"
  pm_tls_insecure = true

  pm_api_token_id     = var.pm_token.id
  pm_api_token_secret = var.pm_token.secret
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
    size    = "64G"
    storage = local.storage.disk
  }

  network = {
    bridge = local.network.bridge
  }
}
