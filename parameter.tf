data "aws_ssm_parameter" "application_name" {
  name  = "/aft_extension/org/application_name"
}
