terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 0.16"
    }
  }
}


provider "iosxe" {
  username  = var.router_username
  password  = var.router_password
  protocol  = "restconf"
  insecure  = false          # true для lab/self-signed, false в проде
  devices = [
    for name, cfg in var.routers : {
      name     = name
      host     = cfg.mgmt_ip_address
      device_type = cfg.device_type
      g2_ip_address = cfg.g2_ip_address 
      g2_mask       = cfg.g2_mask  
      loopback0_ip_address = cfg.loopback0_ip_address
      loopback0_mask = cfg.loopback0_mask
      loopback1_ip_address = cfg.loopback1_ip_address
      loopback1_mask = cfg.loopback1_mask
    }
  ]

}


  