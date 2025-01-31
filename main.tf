/*
 * # wanted-cloud/terraform-azure-resource-group
 * 
 * Terraform building block module of Azure Resource Group.
 */

resource "azurerm_resource_group" "this" {
  name       = var.resource_group_name
  location   = var.location
  managed_by = var.managed_by != "" ? var.managed_by : null
  tags       = merge(local.metadata.tags, var.tags)

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_resource_group"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}