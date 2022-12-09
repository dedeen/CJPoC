/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
	  -- main logic here -- 
*/

# Get account info from AWS in which Terraform is running 

/*data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}  */