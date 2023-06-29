data "proxmox_virtual_environment_role" "admin_role" {
  role_id = "Administrator"
}

resource "proxmox_virtual_environment_user" "hrmny" {
  user_id  = "hrmny@pam"

  acl {
    path      = "/"
    propagate = true
    role_id   = data.proxmox_virtual_environment_role.admin_role.role_id
  }
}

resource "proxmox_virtual_environment_user" "ijon" {
  user_id  = "ijon@pam"

  acl {
    path      = "/"
    propagate = true
    role_id   = data.proxmox_virtual_environment_role.admin_role.role_id
  }
}
