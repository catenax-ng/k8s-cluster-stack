resource "azurerm_dns_a_record" "a-record" {
  name                = var.record_name
  ttl                 = var.ttl
  zone_name           = var.zone_name
  target_resource_id  = var.target_resource_id
  resource_group_name = var.resource_group_name
}