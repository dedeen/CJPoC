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
#
# Build the VPCs for each DC
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"

  for_each = var.regional_dc
    name              = each.value.region_name
    cidr              = each.value.cidr
    azs               = [each.value.publ_az,each.value.priv_az]
    private_subnets   = [each.value.priv_subnet]
    public_subnets    = [each.value.publ_subnet]
    enable_ipv6             = false
    enable_nat_gateway      = true
    one_nat_gateway_per_az  = false # one_nat=false&single_nat=true =>single NATGW
    single_nat_gateway      = true  # one_nat=true&single_nat=false => one NATGW per AZ

}

/*
# Build VPC for the second DC
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.region2_parms["region_loc"]
  cidr            = var.region2_parms["cidr"]
  azs             = [var.region2_parms["publ_az"],
                     var.region2_parms["priv_az"]]
  private_subnets = [var.region2_parms["priv_subnet"]]
  public_subnets  = [var.region2_parms["publ_subnet"]]
  enable_ipv6             = false
  enable_nat_gateway      = true
  one_nat_gateway_per_az  = false # one_nat.. = false & single_nat = true => single NATGW
  single_nat_gateway      = true  # one_nat.. = true & single_nat = false => one NATGW per AZ
 
# Build VPC for the third DC
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.region3_parms["region_loc"]
  cidr            = var.region3_parms["cidr"]
  azs             = [var.region3_parms["publ_az"],
                     var.region3_parms["priv_az"]]
  private_subnets = [var.region3_parms["priv_subnet"]]
  public_subnets  = [var.region3_parms["publ_subnet"]]
  enable_ipv6             = false
  enable_nat_gateway      = true
  one_nat_gateway_per_az  = false # one_nat.. = false & single_nat = true => single NATGW
  single_nat_gateway      = true  # one_nat.. = true & single_nat = false => one NATGW per AZ
  */
 