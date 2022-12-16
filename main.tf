/*  Terraform to create a single VPC in specified region, using vpc module: 
      - Two subnets, one public and one private 
      - NAT GW, IGW with EIP, routes needed 
      
      Use at your own peril, and be mindful of the AWS costs of 
      building this environment.  
      Dan Edeen, dan@dsblue.net, 2022 
	  -- 
*/
#
# Build VPCs for DataCenters
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
    intra_subnets     = [each.value.intra_subnets]
    enable_ipv6             = false
    enable_nat_gateway      = true
    one_nat_gateway_per_az  = false 
    single_nat_gateway      = true  
}

	# Create EC2 Instances in our VPC/Subnets
resource "aws_instance" "ec2-public-subnet" {
    ami             	= "ami-094125af156557ca2"
    instance_type   	= "t2.micro"
    key_name        =	 "${aws_key_pair.generated_key.key_name}"
    associate_public_ip_address = true
    subnet_id           = module.vpc["datacenter1"].public_subnets[0]
    source_dest_check   = false
    tags = {
          Owner = "dan-via-terraform"
	  Name 	- "ec2-inst1-public"
    }
}
	
