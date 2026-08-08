resource "azurerm_key_vault" "kv" {
  for_each            = var.key_vault

  #checkov:skip=CKV2_AZURE_32:Private Endpoint is provisioned separately by the azurerm_private_endpoint module

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  rbac_authorization_enabled = false

  tenant_id = each.value.tenant_id

  sku_name = each.value.sku_name

  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  enabled_for_disk_encryption = true

  public_network_access_enabled = false

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }

  access_policy {

    tenant_id = each.value.tenant_id

    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
  }

}

