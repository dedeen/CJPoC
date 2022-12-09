/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- main logic here -- 
*/

# Get account info from AWS in which Terraform is running 

/*data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}  */
#
# Build the VPCs for each DataCenter

/*
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"

  for_each = var.oregon_dcs
    providers = {
      aws = aws.usw2  # Set region via provider alias
    }
    name              = each.value.region_dc
    cidr              = each.value.cidr
    azs               = each.value.az_list
    private_subnets   = [each.value.priv_subnet]
    public_subnets    = [each.value.publ_subnet]
    enable_ipv6             = false
    enable_nat_gateway      = true
    one_nat_gateway_per_az  = false # one_nat=false&single_nat=true =>single NATGW
    single_nat_gateway      = true  # one_nat=true&single_nat=false => one NATGW per AZ
}
*/
/*
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"

for_each = var.ohio_dcs
    providers = {
      aws = aws.use2  # Set region via provider alias
    }
    name              = each.value.region_dc
    cidr              = each.value.cidr
    azs               = each.value.az_list
    private_subnets   = [each.value.priv_subnet]
    public_subnets    = [each.value.publ_subnet]
    enable_ipv6             = false
    enable_nat_gateway      = true
    one_nat_gateway_per_az  = false # one_nat=false&single_nat=true =>single NATGW
    single_nat_gateway      = true  # one_nat=true&single_nat=false => one NATGW per AZ
}
*/

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"

for_each = var.paris_dcs
    providers = {
      aws = aws.euw3  # Set region via provider alias
    }
    name              = each.value.region_dc
    cidr              = each.value.cidr
    azs               = each.value.az_list
    private_subnets   = [each.value.priv_subnet]
    public_subnets    = [each.value.publ_subnet]
    enable_ipv6             = false
    enable_nat_gateway      = true
    one_nat_gateway_per_az  = false # one_nat=false&single_nat=true =>single NATGW
    single_nat_gateway      = true  # one_nat=true&single_nat=false => one NATGW per AZ
}

