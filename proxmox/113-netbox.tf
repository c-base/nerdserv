module "netbox" {
  source = "../modules/lxc"
  node   = var.node
  pool   = var.pool

  name  = "netbox"
  vm_id = "113"

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.debian_13_lxc_img.id
    type = "debian"
  }
  cores  = 4
  memory = 8192

  disks = [
    {
      storage = rootfs
      size_gb = 32
    }
  ]

  network = {
    bridge          = var.network.bridge
    internal_bridge = proxmox_virtual_environment_network_linux_bridge.internal_bridge.name
  }

  ssh_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJuejyEJmGNjgly1PpmQPTZw2PwrWFG1oyW0cG+7+shS yosijo@c-base.org"
}
