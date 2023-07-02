locals {
  users = {
    hrmny = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEDtuIourWzbibkXqsJYk8IHxl4SIvxmnttrlUALu8XS hrmny@c-base.org"
	saces = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL5JruwHRLLVW1LDcoUymftOgqt6I2khSvvSnNLk7XZ4 saces@c-base.org"
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
