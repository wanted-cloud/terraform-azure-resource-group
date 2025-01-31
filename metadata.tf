locals {
  metadata = {
    resource_timeouts = merge(
      try(local.metadata["resource_timeouts"], {}),
      var.resource_timeouts
    )
    tags = merge(
      { ManagedBy = "Terraform" },
      try(local.metadata["tags"], {}),
      try(var.metadata["tags"], {})
    )
    validator_error_messages = merge(
      try(local.metadata["validator_error_messages"], {}),
      try(var.metadata["validator_error_messages"], {})
    )
    validator_expressions = merge(
      try(local.metadata["validator_expressions"], {}),
      try(var.metadata["validator_expressions"], {})
    )
  }
}

variable "metadata" {
  description = "Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages and default tags."
  default     = {}
  type = object({
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
    tags                     = optional(map(string), {})
  })
}

variable "resource_timeouts" {
  description = "Resource timeouts map is serving as common interface for possible remote override of module resource timeout values."
  type = map(
    object({
      create = optional(string, "30m")
      read   = optional(string, "5m")
      update = optional(string, "30m")
      delete = optional(string, "30m")
    })
  )
  default = {
    default = {}
  }
}
