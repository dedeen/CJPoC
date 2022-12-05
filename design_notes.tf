/* This file is a working draft of the design spec for this AWS TF module. 
    Dan Edeen, dan@dsblue.net, 2022 

The goal of this module is to build a full, working set of data centers 
within AWS. The text below is a working draft as I develop it. 

In AWS
=================
1. Create three VPCs in different regions, each in two AZs
2. In each VPC, create two subnets, one /24 public, one /24 private

Notes:
    VPC-USW   US West (Oregon)  : AZs: us-west-2a, us-west-2b
                                : 10.0.0.0/24 - public
                                : 10.0.1.0/24 - private
    VPC-USE   US East (Ohio)    : AZs: us-east-2a, us-east-2b
                                : 
    VPC-EUW   Europe (Paris)    : AZs: eu-west-3a, eu-west-3b

2. In each VPC, create two subnets, one public routable and one private 




- Create two different DCs in different regions
    (us west)





*/
