variable "linux_virtual_machine" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    size                 = string
    admin_username       = string
    public_key           = string
    nic_name             = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
  }))
}

variable "network_interface_ids" {
  type = map(string)
}