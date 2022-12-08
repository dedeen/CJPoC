/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- variables defined in this file -- 
*/

variable "regional_dc" {
	description = "Map of regional VPC parameters"
	type		= map(any)

	default = {
		region1 = {
			aws_region	= "us-west-2"
			prov_alias	= "usw2"
			region_loc	= "oregon"
			cidr		= "10.0.0.0/16"
			az_list		= ["us-west-2a","us-west-2b"]
			publ_subnet = "10.0.1.0/24"
			priv_subnet	= "10.0.101.0/24"
		},
		region2 = {
			aws_region	= "us-east-2"
			prov_alias	= "use2"
			region_loc	= "ohio"
			cidr		= "172.31.0.0/16"
			az_list		= ["us-east-2a","us-east-2b"]
			publ_subnet	= "172.31.1.0/24"
			priv_subnet	= "172.31.101.0/24"
		}
/*		}, 
		region3 = {
			aws_region	= "eu-west-3"
			region_loc	= "paris"
			cidr		= "192.168.0.0/16"
			az_list		= ["eu-west-3a","eu-west-3b"]
			publ_subnet	= "192.168.1.0/24"
			priv_subnet	= "191.168.101.0/24"       
		}  */
	}
}


variable "home_page" {
	description 	= "default home page of website" 
	type		= string
	default		= "index.html"
}

variable "website_content_path" {
	description	= "location of html for website"
	type		= string
	default		= "/htdocs"
}
