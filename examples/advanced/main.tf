module "template" {
    source = "../.."
    
    resource_group_name = "myResourceGroup"
    location = "northeurope"

    budgets = [{
      name = "budget1"
      amount = 100
      start_date = "2021-01-01T15:04:05Z"
      notifications = [{
            name = "notification1"
            operator = "GreaterThan"
            threshold = 90
        }]
    }]
}