terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_user             = var.pm_user
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}

module "vm" {
  source = "../../modules/vm"

  name                = var.name
  vmid                = var.vmid
  node                = var.node
  clone_from_template = var.clone_from_template
  cores               = var.cores
  sockets             = var.sockets
  memory_mb           = var.memory_mb
  os_type             = var.os_type
  scsihw              = var.scsihw
  net_bridge          = var.net_bridge
  net_model           = var.net_model
  ci_user             = var.ci_user
  ci_password         = var.ci_password
  ssh_public_key_path = var.ssh_public_key_path
  ip                  = var.ip
  vm_cidr             = var.vm_cidr
  vm_gateway          = var.vm_gateway
  onboot              = var.onboot
}