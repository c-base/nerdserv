variable "node" {
  type        = string
  description = "the proxmox node the VMs & containers should run on"
}

variable "pool" {
  type        = string
  default     = null
  description = "the proxmox pool the VMs should be assigned to"
}

variable "storage" {
  type = object({
    disk     = string
    template = string
    snippets = string
  })
  description = "the storage configuration"
}

variable "network" {
  type = object({
    bridge = string
  })
  description = "network config containing the bridge network"
}

variable "users" {
  type = map(object({
    ssh_key = string
  }))
  description = "users with ssh keys"
}
