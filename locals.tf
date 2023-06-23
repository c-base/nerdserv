locals {
  ssh_keys = {
    hrmny = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEDtuIourWzbibkXqsJYk8IHxl4SIvxmnttrlUALu8XS hrmny@c-base.org"
  }

  node = "nerdserv"
  pool = "terraform"

  network = {
    bridge = "vmbr0"
  }

  storage = {
    disk = "data"
  }

  templates = {
    alpine_cloudinit    = "local:vztmpl/alpine-3.18-cloud-amd64_20230621.tar.xz"
    archlinux_cloudinit = "local:vztmpl/archlinux-cloud-amd64_20230621.tar.xz"
    debian_cloudinit    = "local:vztmpl/debian-bookworm-cloud-amd64_20230621.tar.xz"
  }
}
