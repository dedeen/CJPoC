/*  Terraform provider for AWS defined here. 
      Dan Edeen, dan@dsblue.net, 2022 
*/

provider "aws" {
  alias = "usw2"
  region = "us-west-2"

  default_tags {
    tags = {
      #Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}




