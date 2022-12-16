#    Output form vpc creation. datacenter1 and datacenter2 are the VPCs created.
#    Here we get handles to build the rest of the infrastructure. 
#    To do - get clever and loop over the datacenters from the map in vars file. 


output "vpc_dc1-vpc_id" {
  value = module.vpc["datacenter1"].vpc_id
}
output "vpc_dc1-vpc_arn" {
  value = module.vpc["datacenter1"].vpc_arn
}
output "vpc_dc1-vpc_cidr" {
  value = module.vpc["datacenter1"].vpc_cidr_block
}
output "vpc_dc1-vpc_private_snet0" {
  value = module.vpc["datacenter1"].private_subnets[0]
}
output "vpc_dc1-vpc_public_snet0" {
  value = module.vpc["datacenter1"].public_subnets[0]
}
output "vpc_dc1-vpc_intra_snet0" {
  value = module.vpc["datacenter1"].intra_subnets[0]
}

#
output "vpc_dc2-vpc_id" {
  value = module.vpc["datacenter2"].vpc_id
}
output "vpc_dc2-vpc_arn" {
  value = module.vpc["datacenter2"].vpc_arn
}
output "vpc_dc2-vpc_cidr" {
  value = module.vpc["datacenter2"].vpc_cidr_block
}
output "vpc_dc2-vpc_private_snet0" {
  value = module.vpc["datacenter2"].private_subnets[0]
}
output "vpc_dc2-vpc_public_snet0" {
  value = module.vpc["datacenter2"].public_subnets[0]
}
output "vpc_dc2-vpc_intra_snet0" {
  value = module.vpc["datacenter2"].intra_subnets[0]
}