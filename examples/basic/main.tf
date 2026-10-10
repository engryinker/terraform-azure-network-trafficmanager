terraform {
  required_version = ">= 1.7.0"
}

module "network-trafficmanager" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  traffic_manager_profiles = {} # see README Inputs table / upstream module docs for the per-entry schema
}
