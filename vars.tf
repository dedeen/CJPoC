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
			region_name = "vpc_usw"
			region_loc	= "oregon"
			cidr		= "10.0.0.0/16"
			publ_az		= "us-west-2a"
			publ_subnet = "10.0.1.0/24"
			priv_az		= "us-west-2b"
			priv_subnet	= "10.0.101.0/24"
		},
		region2 = {
			region_name = "vpc_use"
			region_loc	= "ohio"
			cidr		= "172.31.0.0/16"
			publ_az		= "us-east-2a"
			publ_subnet	= "172.31.1.0/24"
			priv_az		= "us-east-2b"
			priv_subnet	= "172.31.101.0/24"
		}, 
		region3 = {
			region_name = "vpc_euw"
			region_loc	= "paris"
			cidr		= "192.168.0.0/16"
			publ_az		= "eu-west-3a"
			publ_subnet	= "192.168.1.0/24"
			priv_az		= "eu-west-3b"
			priv_subnet	= "191.168.101.0/24"
		}
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