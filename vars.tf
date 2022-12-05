# Variables used to create multi-site deployment in AWS. 

variable "aws_target_region" {
	description	= "AWS region for website"
	type		= string
	default		= "us-west-2"	#match provider.region in provider.tf
	}

variable "is_registered_domain" {
	description	= "Boolean, is a registered domain, e.g. will add CNAME record ro R53"
	type		= bool
	default		= false
}

variable "home_page" {
	description 	= "default home page of website" 
	type		= string
	default		= "index.html"
}

variable "website_content_path" {
	description	= "location of html for website"
	type		= string
	default		= "/htdocs
