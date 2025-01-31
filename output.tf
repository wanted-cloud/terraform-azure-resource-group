output "resource_group" {
  description = "The created resource group object."
  value       = azurerm_resource_group.this
}

output "budgets" {
  description = "The created resource group assigned budgets."
  value       = azurerm_consumption_budget_resource_group.this
}