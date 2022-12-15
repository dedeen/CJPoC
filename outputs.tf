output "test" {
  description = "ID of VPCs Created"
  value = {
    for i in module.vpc:
      value = [ for oregon_dcs in vpc : oregon_dcs.vpc_id]
  }
}
