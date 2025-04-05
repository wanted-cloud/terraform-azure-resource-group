<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-resource-group

Terraform building block module of Azure Resource Group.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.17.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.17.0)

## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: The location/region where the resources will be created!

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which the resources will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under created resource group.

Type:

```hcl
list(
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
```

Default: `[]`

### <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by)

Description: The ID of the resource that manages this resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Map of tags to be assigned to the resource group.

Type: `object({})`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_budgets"></a> [budgets](#output\_budgets)

Description: The created resource group assigned budgets.

### <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group)

Description: The created resource group object.

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/resource-group/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
    source = "../.."
    
    resource_group_name = "myResourceGroup"
    location = "northeurope"
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->