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
  default     = null
  description = "set a specific ID for the VM"
}

variable "name" {
  type        = string
  description = "the name of the vm"
}

variable "cores" {
  type        = number
  description = "how many cores the VM should have"
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
    bridge = string
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

variable "ssh_keys" {
  type        = list(string)
  default     = null
  description = "clone the vm with the given ID"
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
