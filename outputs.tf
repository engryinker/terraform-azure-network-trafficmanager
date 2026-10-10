output "traffic_manager_profiles" {
  description = "Map (same keys as var.traffic_manager_profiles) of every output from each Traffic Manager profiles created -- see upstream module docs for the full shape."
  value       = module.traffic_manager_profile
}
