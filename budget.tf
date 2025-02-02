resource "azurerm_consumption_budget_resource_group" "this" {
  for_each = {
    for budget in var.budgets : budget.name => budget
  }

  resource_group_id = azurerm_resource_group.this.id

  name       = each.value.name
  amount     = each.value.amount
  time_grain = each.value.time_grain

  time_period {
    start_date = each.value.start_date
    end_date   = each.value.end_date
  }

  dynamic "filter" {
    for_each = lookup(each.value, "filter", null) != null ? [ each.value.filter ] : []
    content {
      dynamic "dimension" {
        for_each = lookup(filter.value, "dimensions", [])
        content {
          name   = dimensions.value.name
          values = dimensions.value.values
        }
      }

      dynamic "tag" {
        for_each = lookup(filter.value, "tags", [])
        content {
          name   = tags.value.name
          values = tags.value.values
        }
      }
    }
  }

  dynamic "notification" {
    for_each = {
      for notification in each.value.notifications : notification.name => notification
    }
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type
      contact_emails = notification.value.contact_emails
      contact_groups = notification.value.contact_groups
      contact_roles  = notification.value.contact_roles
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_resource_group"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_resource_group"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_resource_group"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_resource_group"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}