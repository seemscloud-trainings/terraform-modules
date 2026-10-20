locals {
  name = join("-", compact([var.prefix, var.name]))

  scope = {
    account_id        = var.account_id
    account_name      = var.account_name
    subscription_id   = var.subscription_id
    subscription_name = var.subscription_name
    compartment_id    = var.compartment_id
    compartment_name  = var.compartment_name
    project_id        = var.project_id
    project_name      = var.project_name
    region_name       = var.region_name
    environment_name  = var.environment_name
  }

  triggers = merge(
    var.labels,
    { for key, value in local.scope : key => value if value != null },
    { name = local.name }
  )
}
