<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-module-template

This repository represents a template for a Terraform building block module as we think it should be done, so it's for sure opinionated but in our eyes simple and powerful. Feel free to use or contribute.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

No requirements.

## Providers

No providers.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages and default tags.

Type:

```hcl
object({
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
    tags                     = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_resource_timeouts"></a> [resource\_timeouts](#input\_resource\_timeouts)

Description: Resource timeouts map is serving as common interface for possible remote override of module resource timeout values.

Type:

```hcl
map(
    object({
      create = optional(string, "30m")
      read   = optional(string, "5m")
      update = optional(string, "30m")
      delete = optional(string, "30m")
    })
  )
```

Default:

```json
{
  "default": {}
}
```

## Outputs

No outputs.

## Resources

No resources.

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
    source = "../.."
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->