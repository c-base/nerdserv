output "id" {
  value = proxmox_virtual_environment_container.container.id
}

output "default_root_password" {
  value     = random_password.container_password.result
  sensitive = true
}
