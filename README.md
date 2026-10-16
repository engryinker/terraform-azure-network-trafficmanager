# terraform-azure-network-trafficmanager

Org-standard Terraform wrapper for: **Traffic Manager profiles**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-trafficmanager" {
  source = "git::https://github.com/engryinker/terraform-azure-network-trafficmanager.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  traffic_manager_profiles = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `traffic_manager_profiles` (Traffic Manager profiles)

Wraps [Azure/avm-res-network-trafficmanagerprofile/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-trafficmanagerprofile/azurerm/0.1.1) v0.1.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `max_return` | `number` | no |  |
| `traffic_routing_method` | `string` | yes |  |
| `azure_endpoints` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `profile_status` | `string` | no |  |
| `role_assignments` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `external_endpoints` | `any` | no |  |
| `resource_types` | `any` | no |  |
| `retry` | `any` | no |  |
| `traffic_view_enrollment_status` | `string` | no |  |
| `dns_config` | `any` | yes |  |
| `ignore_body_changes` | `any` | no |  |
| `monitor_config` | `any` | yes |  |
| `allowed_endpoint_record_types` | `list(string)` | no |  |
| `lock` | `any` | no |  |
| `nested_endpoints` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `traffic_manager_profiles` -- map (same keys as the input) of every output from each created Traffic Manager profiles.
