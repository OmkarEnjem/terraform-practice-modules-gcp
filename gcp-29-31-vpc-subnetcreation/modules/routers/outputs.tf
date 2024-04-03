#Output Router IDs
output "router_ids" {
  description = "Router Id"
  value = tomap({
    for k, cloud_router_map in google_compute_router.cloud_router_map : k => cloud_router_map.id
  })
}
#Output Router Name
output "router_name" {
  description = "Router Name"
  value = tomap({
    for k, cloud_router_map in google_compute_router.cloud_router_map : k => cloud_router_map.name
  })
}

