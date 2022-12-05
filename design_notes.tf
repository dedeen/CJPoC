/*  Terraform to create a full and detailed (3) data center AWS deployment. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
      -- design details contained herein -- 

The goal of this module is to build a full, working set of data centers 
within AWS. The text below is a working draft as I develop it. 

In AWS
=================
1. Create three VPCs in different regions, each in two AZs
2. In each VPC, create two subnets, one /24 public, one /24 private

Notes:
    vpc-usw   US West (Oregon)  : AZs: us-west-2a (public), us-west-2b (private)
                                  cidr:     10.0.0.0/16
                                  subnet 1: 10.0.1.0/24 - public
                                  subnet 2: 10.0.101.0/24 - private
                                
    vpc-use   US East (Ohio)    : AZs: us-east-2a, us-east-2b
                                  cidr:     172.31.0.0/16
                                  subnet 1: 172.31.1.0/24 - public
                                  subnet 2: 172.31.101.0/24 - private
                                
    vpc-euw   Europe (Paris)    : AZs: eu-west-3a, eu-west-3b
                                  cidr:     192.168.0.0/16
                                  subnet 1: 192.168.1.0/24 - public
                                  subnet 2: 192.168.101.0/24 - private

3. Net & security in each VPC   : NAT GW    - in each public subnet 
                                  IGW       - in each VPC
                                  route to I from private subnet via NAT GW
                                  route to I from public subnet via IGW
                                  Elastic IP on the NAT GW 



4. Hosts in each VPC            : LAMP stack webserver (EC2 t2-micro) - public subnet
                                    AWS Linux AMI /Apache/MySQL/PHP, with Python added

                                : MEAN stack webserver (EC2 t2-micro) - public subnet
                                    MongoDB/Express.js/Node.js/Angular/js 

4a. LAMP server specifics:
        >> AWS Linux AMI /Apache/MySQL/PHP, with Python added
            amzn2-ami-kernel-5.10-hvm-2.0.20221103.3-x86_64-gp2ami-0b0dcb5067f052a63
        sudo yum update -y
        sudo yum install -y httpd24 php72 mysql57-server php72-mysqlnd
        sudo service httpd start 
        sudo chkconfig httpd on
        >> chkconfig --list httpd   #confirm apache running 
        >> need to add a security group to allow inbound http/tcp/80/src=custom, perhaps SSH also
        >> retrieve public DNS address of the instance (need to do via API)
        >> browse to the web server from the outside - should get the Apache test page 
    
4b. MEAN server specifics: 
        >> AWS Ubuntu Server 18.04 AMI (free tier) 
            ami-061dbd1209944525c
        ~~ fill in the details here later

5. Private VPC in VPC-USW will host OSS functions: (~~ add details as built)
    Splunk SEIM 
    syslog server
    DNS server
    Palo Alto Networks Panorama v10.1 



*/
