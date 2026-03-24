variable "routers" {
  description = "Map of routers"
  type = map(object({
    loopback0_ip_address = string
    loopback0_mask = string
    loopback1_ip_address = string
    loopback1_mask = string
  }))
}