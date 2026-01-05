terraform {
  backend "s3" {
    bucket         = "scp.tf-state.codzs.space"
    key            = "scp/terraform.tfstate"
    dynamodb_table = "scp.tf_state"
  }
}