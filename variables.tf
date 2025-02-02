variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string

  validation {
    condition = can(
      regex(
        local.metadata.validator_expressions["azurerm_resource_group_name"],
        var.resource_group_name
      )
    )
    error_message = local.metadata.validator_error_messages["azurerm_resource_group_name"]
  }
}

variable "location" {
  description = "The location/region where the resources will be created!"
  type        = string

  validation {
    condition = can(
      regex(
        local.metadata.validator_expressions["azurerm_location"],
        var.location
      )
    )
    error_message = local.metadata.validator_error_messages["azurerm_location"]
  }
}

variable "tags" {
  default     = {}
  description = "Map of tags to be assigned to the resource group."
  type        = object({})
}

variable "managed_by" {
  default     = ""
  description = "The ID of the resource that manages this resource group."
  type        = string
}

variable "budgets" {
  default     = []
  description = "List of budgets to be assigned under created resource group."
  type = list(
    object({
      name       = string
      amount     = number
      time_grain = optional(string)
      start_date = string
      end_date   = optional(string)
      filter = optional(object({
        dimensions = list(object({
          name   = string
          values = list(string)
        }))
        tags = list(object({
          name   = string
          values = list(string)
        }))
      }), null)
      notifications = list(object({
        contact_emails = optional(list(string))
        contact_groups = optional(list(string))
        contact_roles  = optional(list(string))
        enabled        = optional(bool, true)
        name           = string
        threshold      = number
        operator       = string
        threshold_type = optional(string)
      }))
    })
  )

  validation {
    condition = alltrue([
      for budget in var.budgets : 
        budget.time_grain != null ? can(
          regex(
            local.metadata.validator_expressions["azurerm_consumption_budget_resource_group_time_grain"],
            budget.time_grain
          )
        ) : true
    ])
    error_message = local.metadata.validator_error_messages["azurerm_consumption_budget_resource_group_time_grain"]
  }
}