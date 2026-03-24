resource "iosxe_interface_loopback" "r1_loopback0" {
  for_each = var.routers
  device = each.key
  name                = 0          # номер интерфейса Loopback0
  description         = "loopback 0 OSPF"
  shutdown            = false
  ipv4_address        = each.value.loopback0_ip_address
  ipv4_address_mask   = each.value.loopback0_mask
}


resource "iosxe_interface_loopback" "r1_loopback1" {
  for_each = var.routers
  device = each.key
  name                = 1          # номер интерфейса Loopback0
  description         = "loopback 1 OSPF"
  shutdown            = false
  ipv4_address        = each.value.loopback1_ip_address
  ipv4_address_mask   = each.value.loopback1_mask
}