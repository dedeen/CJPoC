/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- variables defined in this file -- 
*/

variable "region1_parms" {
	description = "parms for first regional DC"
	type 		= map
	default		= {
		region_name = "vpc_usw"
		region_loc	= "oregon"
		publ_az		= "us-west-2a"
		publ_cidr 	= "10.0.0.0/24"
		priv_az		= "us-west-2b"
		priv_cidr 	= "10.0.0.0/24"
		}
}

variable "region2_parms" {
	description = "parms for second regional DC"
	type 		= map
	default		= {
		region_name = "vpc_use"
		region_loc	= "ohio"
		publ_az		= "us-east-2a"
		publ_cidr 	= "172.31.0.0/24"
		priv_az		= "us-east-2b"
		priv_cidr 	= "172.31.1.0/24"
		}
}

variable "region3_parms" {
	description = "parms for third regional DC"
	type 		= map
	default		= {
		region_name = "vpc_euw"
		region_loc	= "paris"
		publ_az		= "eu-west-3a"
		publ_cidr 	= "192.168.0.0/24"
		priv_az		= "eu-west-3b"
		priv_cidr 	= "191.168.1.0/24"
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