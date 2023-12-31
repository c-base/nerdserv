data "proxmox_virtual_environment_role" "admin_role" {
  role_id = "Administrator"
}

resource "proxmox_virtual_environment_user" "hrmny" {
  user_id = "hrmny@pam"
}

resource "proxmox_virtual_environment_acl" "hrmny_admin" {
  user_id   = "hrmny@pam"
  path      = "/"
  propagate = true
  role_id   = data.proxmox_virtual_environment_role.admin_role.role_id
}

resource "proxmox_virtual_environment_user" "ijon" {
  user_id = "ijon@pam"
}

resource "proxmox_virtual_environment_acl" "ijon_admin" {
  user_id   = "ijon@pam"
  path      = "/"
  propagate = true
  role_id   = data.proxmox_virtual_environment_role.admin_role.role_id
}

resource "proxmox_virtual_environment_user" "member" {
  for_each = var.users
  user_id  = "${each.key}@ldap"
}

// add pve username to user object
locals {
  users = {
    for name, user in var.users : name => {
      username = proxmox_virtual_environment_user.member[name].user_id
      ssh_key  = user.ssh_key
    }
  }
}
