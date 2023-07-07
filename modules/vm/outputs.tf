output "id" {
  value = proxmox_virtual_environment_vm.vm.id
}

output "default_root_password" {
  value     = random_password.default_root_password.result
  sensitive = true
}
