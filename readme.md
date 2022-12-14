# IaC Scripts for AWS
This repo contains two sets of scripts that I've created to build resources in AWS. 

Dan Edeen, dan@dsblue.net, 2022 

## AWS CloudShell Scripts
Text here

## Terraform/AWS Scripts 
Test Here

## Prerequisites
There are a a few steps to set up the environment: 
* Log in to your AWS environment and launch a CloudShell terminal window. 
* Clone repo to CloudShell, git is already installed. 
* Run *setup.sh*; this will install Terraform and a couple of other useful tools. 
Environment is ready to run Terraform scripts. 

## Running .tf Scripts to Build AWS Infrastructure
1. CD to the directory with .tf scripts and run the following commands. Follow the prompts. 
2. `$terraform init`
3. `$terraform plan`
4. `$terraform apply`


## Cleaning up AWS Infrastructure

The scripts contained here apply tags in the provider.tf file. These tags can be searched from 
AWS console or CLI to confirm. When you are finished you should delete the resources created. 

`$terraform destroy`

You can confirm the resources have been deleted by again searching on the tags. 

## Script Summaries
### AWS_Query_Build_Resources_Basic ### 
Build some basic resources in AWS: VPC, IGW, Public Subnet & Routes, and a few EC2s in the VPC. 

### AWS_Query_Env ### 
Retrieve setup, resources, summary of your EC2 environment. 

