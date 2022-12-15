/*
output "test" {
  description = "ID of VPCs Created"
  value = {
    for i in module.vpc:
      value = [ for new_vpcs in vpc : oregon_dcs.vpc_id]
  }
}

*/