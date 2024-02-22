# Create Tag Policy
resource "aws_organizations_policy" "tag_policy" {
  name        = "${local.application_name} Custom Tag Policies - ${terraform.workspace}"
  description = "${local.application_name} custom tag policies to deny via SCP."

  content = jsonencode({
    "tags" = {
      "Name" = {
        "tag_key"      = { "@@assign" = var.name_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Environment" = {
        "tag_key"      = { "@@assign" = var.environment_tag_key },
        "tag_value"    = { "@@assign" = var.environment_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Owner" = {
        "tag_key"      = { "@@assign" = var.owner_tag_key },
        "tag_value"    = { "@@assign" = var.owner_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "CostCenter" = {
        "tag_key"      = { "@@assign" = var.costcenter_tag_key },
        "tag_value"    = { "@@assign" = var.costcenter_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Application" = {
        "tag_key"      = { "@@assign" = var.application_tag_key },
        "tag_value"    = { "@@assign" = var.application_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Platform" = {
        "tag_key"      = { "@@assign" = var.platform_tag_key },
        "tag_value"    = { "@@assign" = var.platform_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Organization" = {
        "tag_key"      = { "@@assign" = var.organization_tag_key },
        "tag_value"    = { "@@assign" = var.organization_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Department" = {
        "tag_key"      = { "@@assign" = var.department_tag_key },
        "tag_value"    = { "@@assign" = var.department_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "PatchCycle" = {
        "tag_key"      = { "@@assign" = var.patch_cycle_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "PowerManagement" = {
        "tag_key"      = { "@@assign" = var.power_management_tag_key },
        "tag_value"    = { "@@assign" = var.power_management_tag_value },
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
