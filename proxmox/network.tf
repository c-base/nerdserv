resource "proxmox_virtual_environment_network_linux_bridge" "internal_bridge" {
  node_name = var.node

  name     = "vmbr1"
  address   = "10.23.42.1/24"
}
