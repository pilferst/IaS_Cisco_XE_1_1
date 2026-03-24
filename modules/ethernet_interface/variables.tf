variable "routers" {
  description = "Map of routers"
  type = map(object({
    g2_ip_address = string
    g2_mask       = string
  }))
}

variable "description" {
  type    = string
  default = "LAN inside - Terraform"
}