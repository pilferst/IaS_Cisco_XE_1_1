module "ethernet_interface" {
  source = "./modules/ethernet_interface"

  routers     = var.routers
  description = "LAN inside - Router - Terraform"
}


module "loopback_interface" {
  source = "./modules/loopback_interface"
  routers     = var.routers
   
}


module "ospf" {
  source = "./modules/ospf"
  routers     = var.routers 
}

/*resource "iosxe_interface_ethernet" "r1_ge2" {
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
*/

/*
resource "iosxe_interface_loopback" "r1_loopback0" {
  for_each = var.routers
  device = each.key
  name                = 0          # номер интерфейса Loopback0
  description         = "loopback 0 OSPF"
  shutdown            = false
  ipv4_address        = each.value.loopback0_ip_address
  ipv4_address_mask   = each.value.loopback0_mask
}
*/


/*
resource "iosxe_interface_loopback" "r1_loopback1" {
  for_each = var.routers
  device = each.key
  name                = 1          # номер интерфейса Loopback0
  description         = "loopback 1 OSPF"
  shutdown            = false
  ipv4_address        = each.value.loopback1_ip_address
  ipv4_address_mask   = each.value.loopback1_mask
}
*/




/*
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
      area     = "0"
    },
    {
      ip       = each.value.loopback0_ip_address         # пример второго маршрута (например, другая подсеть)
      wildcard = "0.0.0.0"
      area     = "0"
    }
  ]
}
*/



/*
resource "iosxe_interface_loopback" "r1_loopback0" {
  provider = iosxe.router1

  name                = 0          # номер интерфейса Loopback0
  description         = "loopback 0 OSPF"
  shutdown            = false
  ipv4_address        = "192.168.254.1"
  ipv4_address_mask   = "255.255.255.255"

}


resource "iosxe_interface_loopback" "r1_loopback1" {
  provider = iosxe.router1
  
  name                = 1          # номер интерфейса Loopback0
  description         = "loopback 0 OSPF"
  shutdown            = false
  ipv4_address        = "192.168.255.1"
  ipv4_address_mask   = "255.255.255.255"

}


resource "iosxe_ospf" "r1_ospf" {
  provider = iosxe.router1
  
  process_id = 1
  router_id  = "1.1.1.1"
  passive_interface_default = false
  default_information_originate = false
  shutdown = false


  networks = [
    {
      ip       = "192.168.10.1"     # LAN внутри роутера (из вашего предыдущего примера)
      wildcard = "0.0.0.0"
      area     = "0"
    },
    {
      ip       = "192.168.254.1"         # пример второго маршрута (например, другая подсеть)
      wildcard = "0.0.0.0"
      area     = "0"
    }
  ]
  
}
*/