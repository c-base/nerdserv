resource "proxmox_virtual_environment_file" "alpine_cloud_template" {
  content_type = "vztmpl"
  datastore_id = var.storage.template
  node_name    = var.node

  source_file {
    path      = "https://images.linuxcontainers.org/images/alpine/3.18/amd64/cloud/20230625_13%3A01/rootfs.tar.xz"
    checksum  = "285333d074540e19a589bac80b12af6a4a538611c7f92f14955c3981d997a289"
    file_name = "alpine-3.18-cloud-amd64_20230625.tar.xz"
  }
}
