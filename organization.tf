data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_unit" "workload_ou" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
  name      = "Workload"
}

data "aws_organizations_organizational_unit" "workload_ou_type" {
  parent_id = data.aws_organizations_organizational_unit.workload_ou.id
  name      = var.workload_ou_type_name
}
