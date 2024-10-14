<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-resource-group

Terraform building block for creation and management of Azure Resource Group.

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.113.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.113.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_region"></a> [region](#input\_region)

Description: The location/region where the resources will be created.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the resources will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under resource group.

Type:

```hcl
list(object({
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
```

Default: `[]`

### <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by)

Description: The ID of the resource that manages this resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Module metadata object to give user possibility to override default module values.

Type:

```hcl
object({
    default_tags             = optional(map(string), {})
    resource_timeouts        = optional(map(map(string)), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key value pairs of custom tags to be applied to the module resources.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group)

Description: Output of the resource group object.

Created by WANTED.solutions s.r.o.
---
<sup><sub>_2024 &copy; All rights reserved - WANTED.solutions s.r.o. [<@wanted-solutions>](https://github.com/wanted-solutions)_</sub></sup>
<!-- END_TF_DOCS -->