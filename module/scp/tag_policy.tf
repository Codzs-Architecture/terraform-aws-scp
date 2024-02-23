module "tags_client" {
  source  = "Codzs-Architecture/tags-client/aws"
  version = "0.0.3"
}

data "aws_ssm_parameter" "environment_tag_value" {
  name  = "/aft_extension/org/tag/environment_tag_value"
}

data "aws_ssm_parameter" "costcenter_tag_value" {
  name  = "/aft_extension/org/tag/costcenter_tag_value"
}

data "aws_ssm_parameter" "application_tag_value" {
  name  = "/aft_extension/org/tag/application_tag_value"
}

data "aws_ssm_parameter" "platform_tag_value" {
  name  = "/aft_extension/org/tag/platform_tag_value"
}

data "aws_ssm_parameter" "department_tag_value" {
  name  = "/aft_extension/org/tag/department_tag_value"
}

data "aws_ssm_parameter" "power_management_tag_value" {
  name  = "/aft_extension/org/tag/power_management_tag_value"
}

# Create Tag Policy
resource "aws_organizations_policy" "tag_policy" {
  name        = "${local.application_name} Custom Tag Policies - ${terraform.workspace}"
  description = "${local.application_name} custom tag policies to deny via SCP."

  content = jsonencode({
    "tags" = {
      "Name" = {
        "tag_key"      = { "@@assign" = module.tags_client.name_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Environment" = {
        "tag_key"      = { "@@assign" = module.tags_client.environment_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.environment_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Owner" = {
        "tag_key"      = { "@@assign" = module.tags_client.owner_tag_key },
        "tag_value"    = { "@@assign" = var.application_name },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "CostCenter" = {
        "tag_key"      = { "@@assign" = module.tags_client.costcenter_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.costcenter_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Application" = {
        "tag_key"      = { "@@assign" = module.tags_client.application_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.application_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Platform" = {
        "tag_key"      = { "@@assign" = module.tags_client.platform_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.platform_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Organization" = {
        "tag_key"      = { "@@assign" = module.tags_client.organization_tag_key },
        "tag_value"    = { "@@assign" = var.application_name },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Department" = {
        "tag_key"      = { "@@assign" = module.tags_client.department_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.department_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "PatchCycle" = {
        "tag_key"      = { "@@assign" = module.tags_client.patch_cycle_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "PowerManagement" = {
        "tag_key"      = { "@@assign" = module.tags_client.power_management_tag_key },
        "tag_value"    = { "@@assign" = data.aws_ssm_parameter.power_management_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      }
    }
  })

  type = "TAG_POLICY"

  tags = var.tags
}

resource "aws_organizations_policy_attachment" "account_attachment" {
  policy_id = aws_organizations_policy.tag_policy.id
  target_id = var.workload_ou_id
}
