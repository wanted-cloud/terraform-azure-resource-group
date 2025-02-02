locals {
  definitions = {
    tags = { ManagedBy = "Terraform" }
    validator_expressions = {
      // Azure specific
      azurerm_location            = "^(southafricanorth|southafricawest|australiacentral|australiacentral2|australiaeast|australiasoutheast|centralindia|eastasia|japaneast|japanwest|jioindiacentral|jioindiawest|koreacentral|koreasouth|newzealandnorth|southindia|southeastasia|westindia|canadacentral|canadaeast|francecentral|francesouth|germanynorth|germanywestcentral|italynorth|northeurope|norwayeast|norwaywest|polandcentral|spaincentral|swedencentral|switzerlandnorth|switzerlandwest|uksouth|ukwest|westeurope|mexicocentral|israelcentral|qatarcentral|uaecentral|uaenorth|brazilsouth|brazilsoutheast|brazilus|centralus|centraluseuap|eastus|eastus2|eastus2euap|eastusstg|northcentralus|southcentralus|southcentralusstg|westcentralus|westus|westus2|westus3)$"
      azurerm_resource_group_name = "^[a-zA-Z0-9\\-_\\(\\)\\.]{1,90}$"
      azurerm_consumption_budget_resource_group_time_grain = "^(BillingAnnual|BillingMonth|BillingQuarter|Monthly|Quarterly|Annually)$"
    }
    validator_error_messages = {
      // Azure specific
      azurerm_location            = "The location must be a valid Azure region."
      azurerm_resource_group_name = "The resource group name must comply with defined naming convention."
      azurerm_consumption_budget_resource_group_time_grain = "Each time grain must be one of a valid values."
    }
  }
}