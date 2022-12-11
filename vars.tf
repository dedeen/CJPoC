/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- variables defined in this file -- 
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

variable "ohio_dcs" {
	description = "DC parms for Ohio VPCs"
	type		= map(any)

	default = {
		datacenter3 	= {
			#aws_region	= "us-east-2"
			region_dc	= "ohio-dc3"
			cidr		= "192.168.0.0/16"
			az_list		= ["us-east-2a","us-east-2b"]
			publ_subnet	= "192.168.1.0/24"
			priv_subnet	= "192.168.2.0/24"       		}, 
		datacenter4 	= {
			#aws_region	= "us-east-2"
			region_dc	= "ohio-dc4"
			cidr		= "192.168.0.0/16"
			az_list		= ["us-east-2a","us-east-2b"]
			publ_subnet	= "192.168.3.0/24"
			priv_subnet	= "192.168.4.0/24"       
		}
	}
}

variable "paris_dcs" {
	description = "DC parms for Paris VPCs"
	type		= map(any)

	default = {
		datacenter5		= {
			#aws_region	= "eu-west-3"
			region_dc	= "paris-dc5"
			cidr		= "192.168.0.0/16"
			az_list		= ["eu-west-3a","eu-west-3b"]
			publ_subnet	= "192.168.1.0/24"
			priv_subnet	= "192.168.2.0/24"       
		}, 
		datacenter6		= {
			#aws_region	= "eu-west-3"
			region_dc	= "paris-dc6"
			cidr		= "192.168.0.0/16"
			az_list		= ["eu-west-3a","eu-west-3b"]
			publ_subnet	= "192.168.3.0/24"
			priv_subnet	= "192.168.4.0/24"       
		}  
	}
}

variable "sydney_dcs" {
	description = "DC parms for Sydney VPCs"
	type		= map(any)

	default = {
		datacenter7		= {
			#aws_region	= "ap-southeast-2"
			region_dc	= "sydney-dc7"
			cidr		= "192.168.0.0/16"
			az_list		= ["ap-southeast-2a","ap-southeast-2b"]
			publ_subnet	= "192.168.1.0/24"
			priv_subnet	= "192.168.2.0/24"       
		}, 
		datacenter8		= {
			#aws_region	= "ap-southeast-2"
			region_dc	= "sydney-dc8"
			cidr		= "192.168.0.0/16"
			az_list		= ["ap-southeast-2a","ap-southeast-2b"]
			publ_subnet	= "192.168.3.0/24"
			priv_subnet	= "192.168.4.0/24"       
		}  
	}
}
