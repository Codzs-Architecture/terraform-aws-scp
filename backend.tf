terraform {
  backend "s3" {
    bucket         = "scp.tf-state.codzs.space"
    key            = "scp/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "scp.tf_state"
  }
}