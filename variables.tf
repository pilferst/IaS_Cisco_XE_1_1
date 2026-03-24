variable "router_username" {
  type = string
}

variable "router_password" {
  type      = string
  sensitive = true
}

variable "ospf" {
  type = object({
     area = number
  })  
}
variable "router1_host" {
  type = string
}

variable "routers" {
  description = "List of all routers"
  type = map(object({
    hostname      = string
    mgmt_ip_address    = string
    device_type   = string
    g2_ip_address = string
    g2_mask       = string
    loopback0_ip_address = string
    loopback0_mask = string
    loopback1_ip_address = string
    loopback1_mask = string

  }))
}