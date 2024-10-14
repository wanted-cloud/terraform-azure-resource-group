variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "region" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "managed_by" {
  description = "The ID of the resource that manages this resource group."
  type        = string
  default     = ""
}

variable "budgets" {
  description = "List of budgets to be assigned under resource group."
  type = list(object({
    name       = string
    amount     = number
    time_grain = string
    start_date = string
    end_date   = string
    filter = object({
      dimension = list(object({
        name   = string
        values = list(string)
      }))
      tag = list(object({
        name   = string
        values = list(string)
      }))
    })
    notifications = list(object({
      enabled        = bool
      threshold      = number
      operator       = string
      threshold_type = string
      contact_emails = list(string)
    }))
  }))
  default = []
}