/*  Terraform to create a single VPC in specified region, using vpc module: 
      - Two subnets, one public and one private 
      - NAT GW, IGW with EIP, routes needed 
      
      Use at your own peril, and be mindful of the AWS costs of 
      building this environment.  
        -- Dan Edeen, dan@dsblue.net, 2022  --
	   
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

# Create SecGrp to allow ICMP into the public subnet
resource "aws_security_group" "allow_inbound_icmp" {
  name          = "allow_inbound_icmp"
  description   = "ICMP inbound"
  vpc_id        = module.vpc["datacenter1"].vpc_id
  ingress {
    description         = "ICMP inbound"
    cidr_blocks         = ["0.0.0.0/0"]
    from_port           = 8
    to_port             = 0
    protocol            = "icmp"
  }
  tags = {
    Name = "allow_inbnd_icmp"
    Owner = "dan-via-terraform"
  }
}

# Create SecGrp to allow all IPv4 traffic into public subnet
resource "aws_security_group" "allow_ipv4" {
  name                  = "allow_ipv4"
  description           = "All inbound v4"
  vpc_id                = module.vpc["datacenter1"].vpc_id
  ingress {
    description         = "All inbound v4"
    cidr_blocks         = ["0.0.0.0/0"]
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
  }
  egress {
    description         = "All outbound v4"
    cidr_blocks         = ["0.0.0.0/0"]
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
  }
  tags = {
    Name = "allow_ipv4"
    Owner = "dan-via-terraform"
  }
}

# Create EC2 Instance(s) in the public subnet
resource "aws_instance" "ec2-public-subnet" {
    ami                                 = "ami-094125af156557ca2"
    instance_type                       = "t2.micro"
    key_name                            = "${aws_key_pair.generated_key.key_name}"
    associate_public_ip_address         = true
    subnet_id                           = module.vpc["datacenter1"].public_subnets[0]
    vpc_security_group_ids              = [aws_security_group.allow_inbound_icmp.id, aws_security_group.allow_ipv4.id]
    #security_groups                    = ["allow_ipv4", "allow_inbound_icmp"]
    source_dest_check                   = false
    tags = {
          Owner = "dan-via-terraform"
          Name  = "ec2-inst1-public"
    }
}
                                                       