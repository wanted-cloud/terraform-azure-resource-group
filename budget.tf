resource "azurerm_consumption_budget_resource_group" "this" {
  for_each = {
    for budget in var.budgets : budget.name => budget
  }

  name              = each.value.name
  resource_group_id = azurerm_resource_group.this.id
  amount            = each.value.amount
  time_grain        = each.value.time_grain

  time_period {
    start_date = each.value.start_date
    end_date   = each.value.end_date
  }

  filter {
    dynamic "dimension" {
      for_each = {
        for dimension in each.value.filter.dimensions : dimension.name => dimension
      }
      content {
        name   = dimension.value.name
        values = dimension.value.value
      }

    }

    dynamic "tag" {
      for_each = {
        for tag in each.value.filter.tag : tag.name => tag
      }
      content {
        name   = tag.value.name
        values = tag.value.values
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