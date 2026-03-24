variable "routers" {
  description = "Map of routers"
  type = map(object({
    loopback0_ip_address = string
  }))
}

variable "bgp" {
  type = object({
     as = number
  })  
}