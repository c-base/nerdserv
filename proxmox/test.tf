module "test_lxc" {
  source = "../modules/lxc"

  name = "test"
  node = var.node

  pool = var.pool

  cores  = 4
  memory = 4096

  disk = {
    // gigabytes
    size    = 32
    storage = var.storage.disk
  }

  network = {
    bridge = var.network.bridge
  }

  operating_system = {
    template_file_id = proxmox_virtual_environment_file.alpine_cloud_template.id
    type             = "alpine"
  }

  ssh_keys = [
    var.users["hrmny"].ssh_key
  ]
}
