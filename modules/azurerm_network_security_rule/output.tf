output "rule_names" {
  value = keys(azurerm_network_security_rule.rule)
}