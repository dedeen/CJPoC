# Terraform provider for AWS
# Tagging to verify build and destroy via AWS console
provider "aws" {
  #region = "us-west-2"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}
