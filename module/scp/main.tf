locals {
  json_files = fileset(path.module, "./service/workload/**/*.json")   
  json_as_string = join(",", [ for f in local.json_files : file("${path.module}/${f}") ])
  json_replace_instance_type = replace(local.json_as_string, "instance_type", jsonencode(var.instance_type))
  json_replace_instance_size = replace(local.json_replace_instance_type, "instance_size", jsonencode(var.instance_size))
  json_replace_imdsv2_max_hop = replace(local.json_replace_instance_size, "var.imdsv2_max_hop", tostring(var.imdsv2_max_hop))

  json_data = format("{ \"Statement\": [%s], \"Version\": \"2012-10-17\"}", local.json_replace_imdsv2_max_hop)
}

resource "aws_organizations_policy" "scp_custom_policies" {
  name        = "Codzs Custom SCP Policies - ${terraform.workspace}"
  description = "Codzs custom policies to deny via SCP."

  content = local.json_data

  tags  = {
    "${var.name_tag_key}": "Codzs Custom SCP Policies - ${terraform.workspace}",
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
