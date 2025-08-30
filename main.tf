locals {
  table_name          = "${var.yourname}-bookinventory"
  policy_name         = "${var.yourname}-dynamodb-read"
  role_name           = "${var.yourname}-dynamodb-read-role"
  instance_profile    = "${local.role_name}-profile"
  project_tag         = "ddb-read-demo"
common_tags = {
    Project   = local.project_tag
    Owner     = var.yourname
    Deployed  = "Terraform"
  }
}

