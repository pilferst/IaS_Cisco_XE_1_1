resource "iosxe_ospf" "r_ospf" {
  for_each = var.routers
  device = each.key
  process_id = 1
  router_id  = each.value.loopback0_ip_address
  passive_interface_default = false
  default_information_originate = false
  shutdown = false
  networks = [
    {
      ip       = each.value.g2_ip_address     # LAN внутри роутера (из вашего предыдущего примера)
      wildcard = "0.0.0.0"
      area     = var.ospf.area
    },
    {
      ip       = each.value.loopback0_ip_address         # пример второго маршрута (например, другая подсеть)
      wildcard = "0.0.0.0"
      area     = var.ospf.area
    }
  ]
}