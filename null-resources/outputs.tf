output "id" {
  value = null_resource.main.id
}

output "name" {
  value = local.name
}

output "labels" {
  value = var.labels
}
