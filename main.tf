module "scp_non_prod_workload_ou" {
  source = "./module/scp"

  workload_ou_id = data.aws_organizations_organizational_unit.workload_ou_type.id

  application_name = local.application_name
  instance_type    = var.instance_type
  instance_size    = var.instance_size
  imdsv2_max_hop   = var.imdsv2_max_hop

  enforce_for_values = var.enforce_for_values

  tags = local.tags
}
