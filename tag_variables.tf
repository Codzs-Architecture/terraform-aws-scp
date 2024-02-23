module "tags_client" {
  source  = "Codzs-Architecture/tags-client/aws"
  version = "0.0.3"
}

locals {
  tags = {
    "${module.tags_client.name_tag_key}" : "${local.application_name} Custom SCP Policies - ${terraform.workspace}",
    "${module.tags_client.environment_tag_key}" : "${terraform.workspace}",
    "${module.tags_client.owner_tag_key}" : "${local.application_name}",
    "${module.tags_client.costcenter_tag_key}" : "technology",
    "${module.tags_client.application_tag_key}" : "shared",
    "${module.tags_client.platform_tag_key}" : "shared",
    "${module.tags_client.organization_tag_key}" : "${local.application_name}",
    "${module.tags_client.department_tag_key}" : "platform"
  }
}