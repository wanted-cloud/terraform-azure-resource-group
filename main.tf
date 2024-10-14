/**
 * # wanted-cloud/terraform-azure-resource-group
 *
 * Terraform building block for creation and management of Azure Resource Group. 
 *
 */
resource "azurerm_resource_group" "this" {
  name       = var.resource_group_name
  location   = var.region
  managed_by = var.managed_by != "" ? var.managed_by : null
  tags       = local.tags
}
