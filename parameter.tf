data "aws_ssm_parameter" "application_name" {
  name = "/aft_extension/org/application_name"
}

resource "aws_ssm_parameter" "name_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/name_tag_key"
  type  = "String"
  value = var.name_tag_key
}

resource "aws_ssm_parameter" "environment_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/environment_tag_key"
  type  = "String"
  value = var.environment_tag_key
}

resource "aws_ssm_parameter" "owner_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/owner_tag_key"
  type  = "String"
  value = var.owner_tag_key
}

resource "aws_ssm_parameter" "costcenter_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/costcenter_tag_key"
  type  = "String"
  value = var.costcenter_tag_key
}

resource "aws_ssm_parameter" "application_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/application_tag_key"
  type  = "String"
  value = var.application_tag_key
}

resource "aws_ssm_parameter" "platform_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/platform_tag_key"
  type  = "String"
  value = var.platform_tag_key
}

resource "aws_ssm_parameter" "organization_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/organization_tag_key"
  type  = "String"
  value = var.organization_tag_key
}

resource "aws_ssm_parameter" "department_tag_key" {
  count = terraform.workspace == "np" ? 1 : 0
  name  = "/aft_extension/org/tag/department_tag_key"
  type  = "String"
  value = var.department_tag_key
}