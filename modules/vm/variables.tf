variable "node" {
  type        = string
  description = "the proxmox node the VM should run on"
}

variable "pool" {
  type        = string
  default     = null
  description = "the proxmox pool the VM should be assigned to"
}

variable "vm_id" {
  type        = string
  description = "set a specific ID for the VM"
  validation {
    condition     = var.vm_id != null && var.vm_id != ""
    error_message = "vm_id needs to be a non empty string"
  }
}

variable "name" {
  type        = string
  description = "the name of the vm"
}

variable "cores" {
  type        = number
  description = "how many cores the VM should have"
}

variable "weight" {
  type        = number
  default     = 1024
  description = "CPU shares/weight (defaults to 1024)"
}

variable "machine" {
  type        = string
  default     = "q35"
  description = "qemu machine type"
}

variable "memory" {
  type        = number
  description = "how much memory should be available to the VM"
}

variable "disk" {
  type = object({
    size    = string
    storage = string
  })
  description = "the disk size and storage"
}

variable "network" {
  type = object({
    bridge          = string
    internal_bridge = string
  })
  description = "network config containing the bridge network"
}

variable "qemu_agent" {
  type        = bool
  default     = true
  description = "whether to enable the QEMU agent (needs support from the guest)"
}

variable "clone" {
  type        = string
  default     = null
  description = "clone the vm with the given ID"
}

variable "admins" {
  type = list(object({
    username = string
    ssh_key  = string
  }))
}

variable "template" {
  type        = bool
  default     = false
  description = "mark the vm as a template"
}

variable "started" {
  type        = bool
  default     = true
  description = "start the VM after creation"
}
