resource "iosxe_bgp" "r_bgp" {
  for_each = var.routers
  device = each.key
  asn  = var.bgp.as
  default_ipv4_unicast = false
  log_neighbor_changes = true
  bgp_graceful_restart = true
  bgp_update_delay     = 200
  router_id_ip = each.value.loopback0_ip_address
}