locals {
  name = join("-", compact([var.prefix, var.name]))

  triggers = merge(var.labels, {
    name = local.name
  })
}
