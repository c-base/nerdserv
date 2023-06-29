locals {
  users = {
    hrmny = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEDtuIourWzbibkXqsJYk8IHxl4SIvxmnttrlUALu8XS hrmny@c-base.org"
    }
  }

  node = "nerdserv"
  pool = "terraform"

  network = {
    bridge = "vmbr0"
  }

  storage = {
    disk     = "data"
    template = "local"
  }
}
