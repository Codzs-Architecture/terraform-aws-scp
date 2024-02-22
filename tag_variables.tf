# module "tags_client" {
#   source  = "Codzs-Architecture/tags-client/aws"
#   version = "0.0.1"
# }

locals {
  tags = {
    "${var.name_tag_key}" : "${local.application_name} Custom SCP Policies - ${terraform.workspace}",
    "${var.environment_tag_key}" : "${terraform.workspace}",
    "${var.owner_tag_key}" : "${local.application_name}",
    "${var.costcenter_tag_key}" : "technology",
    "${var.application_tag_key}" : "shared",
    "${var.platform_tag_key}" : "shared",
    "${var.organization_tag_key}" : "${local.application_name}",
    "${var.department_tag_key}" : "platform"
  }
}