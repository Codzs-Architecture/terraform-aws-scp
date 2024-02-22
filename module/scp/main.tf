resource "aws_organizations_policy" "scp_custom_policies" {
  name        = "${local.application_name} Custom SCP Policies - ${terraform.workspace}"
  description = "${local.application_name} custom policies to deny via SCP."

  content = local.json_data

  tags  = {
    "${var.name_tag_key}": "${local.application_name} Custom SCP Policies - ${terraform.workspace}",
    "${var.environment_tag_key}": "${terraform.workspace}",
    "${var.owner_tag_key}": "${var.policy_owner_tag_value}",
    "${var.costcenter_tag_key}": "${var.policy_costcenter_tag_value}",
    "${var.application_tag_key}": "${var.policy_application_tag_value}",
    "${var.platform_tag_key}": "${var.policy_platform_tag_value}",
    "${var.organization_tag_key}": "${var.policy_organization_tag_value}",
    "${var.department_tag_key}": "${var.policy_department_tag_value}"
  }
}

resource "aws_organizations_policy_attachment" "scp_custom_policies_attachment" {
  policy_id = aws_organizations_policy.scp_custom_policies.id
  target_id = var.workload_ou_id
}
