resource "iosxe_interface_ethernet" "r_ge2" {
  for_each = var.routers
  device = each.key
  type                = "GigabitEthernet"
  name                = "2"
  description         = "LAN inside - Router1 - Terraform"
  shutdown            = false
  ipv4_address        = each.value.g2_ip_address
  ipv4_address_mask   = each.value.g2_mask
  ip_nat_inside       = false
}