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

    metadata = {
      resource_timeouts = {
        default = {
          create = "30m"
          read = "15m"
          update = "30m"
          delete = "30m"
        }
      }
    }
}