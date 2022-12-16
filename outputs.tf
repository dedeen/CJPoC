# Get handles for the VPC elements created for downstream provisioning
#
#     vpcs built with for_each indexed here as xxxxxxx

output "dc1-vpc_id" {
  description = "vpc"
  value = module.vpc["datacenter1"].vpc_id
}
output "dc1-vpc_arn" {
  value = module.vpc["datacenter1"].vpc_arn
}
output "dc1-vpc_cidr" {
  value = module.vpc["datacenter1"].vpc_cidr_block
}
output "dc1-vpc_private_snet0" {
  value = module.vpc["datacenter1"].private_subnets[0]
}
output "dc1-vpc_public_snet0" {
  value = module.vpc["datacenter1"].public_subnets[0]
}
output "dc1-vpc_intra_snet0" {
  value = module.vpc["datacenter1"].intra_subnets[0]
}

output "dc2-vpc_id" {
  description = "vpcs created"
  value = module.vpc["datacenter2"].vpc_id
}