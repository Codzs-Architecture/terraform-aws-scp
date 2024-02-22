resource "aws_organizations_policy" "scp_custom_policies" {
  name        = "${local.application_name} Custom SCP Policies - ${terraform.workspace}"
  description = "${local.application_name} custom policies to deny via SCP."

  content = local.json_data

  tags = var.tags
}

resource "aws_organizations_policy_attachment" "scp_custom_policies_attachment" {
  policy_id = aws_organizations_policy.scp_custom_policies.id
  target_id = var.workload_ou_id
}
