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
  depends_on = [module.vnet]
  source     = "../../azurerm_subnet"
  subnets    = var.sntes
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../azurerm_public_ip"
  public_ips = var.pips
}

