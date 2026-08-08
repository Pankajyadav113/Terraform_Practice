module "rg" {
  source          = "../../azurerm_resource_group"
  resource_groups = var.rgs
}

module "vnet" {
  depends_on       = [module.rg]
  source           = "../../azurerm_virtual_network"
  virtual_networks = var.vnets
}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "../../azurerm_subnet"
  subnets    = var.sntes
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../azurerm_public_ip"
  public_ips = var.pips
}

module "nic" {
  depends_on = [module.rg, module.subnet]

  source = "../../azurerm_network_interface"

  nic = var.nics

  subnet_ids = module.subnet.subnet_id
}

module "vm" {
  depends_on            = [module.nic]
  source                = "../../azurerm_linux_virtual_machine"
  linux_virtual_machine = var.vms
  network_interface_ids = module.nic.network_interface_id
}

module "kv" {
  depends_on = [module.rg]
  source     = "../../azurerm_key_vault"
  key_vault  = var.key_vault
}

module "kv_secret" {

  depends_on = [module.kv]

  source = "../../azurerm_key_vault_secret"

  key_vault_secret = {
    vm1_username = {
      key_vault_id = module.kv.key_vault_id["kv1"]
      name         = "vm-admin-username"
      value        = var.vms["vm1"].admin_username
    }

    # vm1_password = {
    #   key_vault_id = module.kv.key_vault_id["kv1"]
    #   name         = "vm-admin-password"
    #   value        = var.vms["vm1"].admin_password
    # }

    vm2_username = {
      key_vault_id = module.kv.key_vault_id["kv1"]
      name         = "vm2-admin-username"
      value        = var.vms["vm2"].admin_username
    }

    # vm2_password = {
    #   key_vault_id = module.kv.key_vault_id["kv1"]
    #   name         = "vm2-admin-password"
    #   value        = var.vms["vm2"].admin_password
    # }

  }

}

module "nsg" {
  depends_on             = [module.rg]
  source                 = "../../azurerm_network_security_group"
  network_security_group = var.nsgs
}

module "nsg_association" {
  depends_on  = [module.subnet, module.nsg]
  source      = "../../azurerm_subnet_network_security_group_association"
  association = var.nsg_association
  subnet_ids  = module.subnet.subnet_id
  nsg_ids     = module.nsg.network_security_group_id
}

module "nsg_rules" {
  depends_on = [module.nsg]
  source     = "../../azurerm_network_security_rule"
  nsg_rules  = var.nsg_rules
}

module "lb" {
  depends_on     = [module.pip]
  source         = "../../azurerm_lb"
  load_balancers = var.load_balancers
  public_ip_ids  = module.pip.public_ip_id
}

module "backend_pool" {
  depends_on    = [module.lb]
  source        = "../../azurerm_lb_backend_address_pool"
  backend_pools = var.backend_pools

  load_balancer_ids = module.lb.load_balancer_id
}

module "nic_backend_pool_association" {

  depends_on = [
    module.nic,
    module.backend_pool
  ]

  source = "../../azurerm_network_interface_backend_address_pool_association"

  nic_associations = var.nic_associations

  nic_ids = module.nic.network_interface_id

  backend_pool_ids = module.backend_pool.backend_pool_ids
}

module "lb_probes" {
  depends_on = [module.lb]
  source     = "../../azurerm_lb_probe"
  lb_probes  = var.lb_probes

  load_balancer_ids = module.lb.load_balancer_id

}

module "lb_rules" {

  depends_on = [module.lb, module.backend_pool, module.lb_probes]

  source = "../../azurerm_lb_rule"

  lb_rules = var.lb_rules

  load_balancer_ids = module.lb.load_balancer_id

  backend_pool_ids = module.backend_pool.backend_pool_ids

  probe_ids = module.lb_probes.probe_ids
}

module "bastion" {

  source = "../../azurerm_bastion_host"

  bastions = var.bastions

  subnet_ids = module.subnet.subnet_id

  public_ip_ids = module.pip.public_ip_id

}

module "kv_private_endpoint" {
  depends_on = [
    module.kv,
    module.subnet
  ]

  source = "../../azurerm_private_endpoint"

  name                = "pe-kv-pankaj"
  location            = "japaneast"
  resource_group_name = "rg-dhondhu"

  subnet_id = module.subnet.subnet_id["private-endpoint-subnet"]

  private_connection_resource_id = module.kv.key_vault_id["kv1"]

  virtual_network_name = "vnet-dhondhu"
}