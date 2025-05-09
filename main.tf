terraform {
  cloud {
    organization = "c-base-nerdserv"
    workspaces {
      name = "nerdserv"
    }
  }

  required_providers {
    proxmox = {
      source  = "ForsakenHarmony/proxmox"
      version = "0.0.0-canary.46302975"
    }
  }

  required_version = ">= 1.11.0"
}
