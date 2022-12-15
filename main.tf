/*  Terraform to create a single VPC in specified region, using vpc module: 
      - Two subnets, one public and one private 
      - NAT GW, IGW with EIP, routes needed 
      
      Use at your own peril, and be mindful of the AWS costs of 
      building this environment.  
      Dan Edeen, dan@dsblue.net, 2022 
	  -- 
*/
#
# Build the VPCs for each DataCenter


module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"

  for_each = var.new_vpcs
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

