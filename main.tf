/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- main logic here -- 
*/

# Get account info from AWS in which Terraform is running 

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

# Build VPC for the first DC
module "vpc" {
  source    = "terraform-aws-modules/vpc/aws"
  name      = var.region1_parms["region_loc"]

  cidr      = var.region1_parms["cidr"]

  azs       = [var.region1_parms["publ_az"],
               var.region1_parms["priv_az"]]
  private_subnets = [var.region1_parms["priv_subnet"]]
  public_subnets  = [var.region1_parms["publ_subnet"]]

  enable_ipv6 = false

  enable_nat_gateway      = true
  one_nat_gateway_per_az  = false
  single_nat_gateway      = true
}

  
