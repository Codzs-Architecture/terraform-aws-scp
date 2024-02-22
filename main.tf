module "scp_non_prod_workload_ou" {
  source = "./module/scp"

  workload_ou_id = data.aws_organizations_organizational_unit.workload_ou_type.id

  application_name = local.application_name
  instance_type    = var.instance_type
  instance_size    = var.instance_size
  imdsv2_max_hop   = var.imdsv2_max_hop

  name_tag_key               = var.name_tag_key
  environment_tag_key        = var.environment_tag_key
  environment_tag_value      = var.environment_tag_value
  owner_tag_key              = var.owner_tag_key
  owner_tag_value            = [local.application_name]
  costcenter_tag_key         = var.costcenter_tag_key
  costcenter_tag_value       = var.costcenter_tag_value
  application_tag_key        = var.application_tag_key
  application_tag_value      = var.application_tag_value
  platform_tag_key           = var.platform_tag_key
  platform_tag_value         = var.platform_tag_value
  organization_tag_key       = var.organization_tag_key
  organization_tag_value     = [local.application_name]
  department_tag_key         = var.department_tag_key
  department_tag_value       = var.department_tag_value
  patch_cycle_tag_key        = var.patch_cycle_tag_key
  power_management_tag_key   = var.power_management_tag_key
  power_management_tag_value = var.power_management_tag_value
  enforce_for_values         = var.enforce_for_values

  tags = local.tags
}
