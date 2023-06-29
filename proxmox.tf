provider "proxmox" {
  endpoint = "https://nerdserv.cbrp3.c-base.org:8006"
  insecure = true

#  api_token = format("%s=%s", var.pm_token.id, var.pm_token.secret)
  username = var.credentials.username
  password = var.credentials.password
}

module "proxmox" {
  source = "./proxmox"

  node = local.node
  storage = local.storage
  network = local.network

  users = local.users
}
