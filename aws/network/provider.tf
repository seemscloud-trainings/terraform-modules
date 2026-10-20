provider "aws" {
  region              = var.region_name
  allowed_account_ids = [var.account_id]
  profile             = var.profile

  dynamic "assume_role" {
    for_each = var.assume_role == null ? [] : [var.assume_role]
    content {
      role_arn     = assume_role.value.role_arn
      session_name = assume_role.value.session_name
      external_id  = assume_role.value.external_id
    }
  }
}
