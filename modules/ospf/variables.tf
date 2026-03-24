variable "routers" {
  description = "Map of routers"
  type = map(object({
    loopback0_ip_address = string
    g2_ip_address = string
  }))
}