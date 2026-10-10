data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "traffic_manager_profile" {
  source   = "Azure/avm-res-network-trafficmanagerprofile/azurerm"
  version  = "0.1.1"
  for_each = var.traffic_manager_profiles

  name                           = each.value.name
  resource_group_name            = var.resource_group_name
  tags                           = coalesce(each.value.tags, var.tags)
  enable_telemetry               = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  max_return                     = each.value.max_return
  traffic_routing_method         = each.value.traffic_routing_method
  azure_endpoints                = each.value.azure_endpoints
  diagnostic_settings            = each.value.diagnostic_settings
  profile_status                 = each.value.profile_status
  role_assignments               = each.value.role_assignments
  timeouts                       = each.value.timeouts
  external_endpoints             = each.value.external_endpoints
  resource_types                 = each.value.resource_types
  retry                          = each.value.retry
  traffic_view_enrollment_status = each.value.traffic_view_enrollment_status
  dns_config                     = each.value.dns_config
  ignore_body_changes            = each.value.ignore_body_changes
  monitor_config                 = each.value.monitor_config
  allowed_endpoint_record_types  = each.value.allowed_endpoint_record_types
  lock                           = each.value.lock
  nested_endpoints               = each.value.nested_endpoints
}
