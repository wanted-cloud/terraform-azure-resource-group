/*
 * # wanted-cloud/terraform-azure-resource-group
 * 
 * Terraform building block module of Azure Resource Group.
 */

resource "azurerm_resource_group" "this" {
  name       = var.resource_group_name
  location   = var.location
  managed_by = var.managed_by != "" ? var.managed_by : null
  tags       = local.metadata.tags
}