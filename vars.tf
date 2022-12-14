/*  Terraform variables defined here. 
      Dan Edeen, dan@dsblue.net, 2022 
*/


variable "oregon_dcs" {
	description = "DC parms for Oregon VPCs"
	type		= map(any)

	default = {
		datacenter1 = {
			#aws_region	= "us-west-2"
			region_dc	= "oregon-dc1"
			cidr		= "192.168.0.0/16"
			az_list		= ["us-west-2a","us-west-2b"]
			publ_subnet	= "192.168.1.0/24"
			priv_subnet	= "192.168.2.0/24"       
		},   
		datacenter2 = {
			#aws_region	= "us-west-2"
			region_dc	= "oregon-dc2"
			cidr		= "192.168.0.0/16"
			az_list		= ["us-west-2a","us-west-2b"]
			publ_subnet	= "192.168.3.0/24"
			priv_subnet	= "192.168.4.0/24"       
		}	
	}   
}



