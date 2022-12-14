# Terraform provider for AWS

provider "aws" {
  alias = "usw2"
  region = "us-west-2"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}




