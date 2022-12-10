/* git add . 
git commit -m “comment”
git push origin main 
*/ 
/*  This repo contains Terraform scripts to create multiple DCs (data centers==VPCs) in 
    different regions. It is currently building 8 VPCs, two each in Oregon, Ohio, Paris, and 
    Sydney. 
      Use at your own peril, and be mindful of the AWS costs of deployment. 
      Dan Edeen, dan@dsblue.net, 2022 
      -- design details contained herein, and is a work in progress subject to change. -- 

Regions used: 
    usw2   US West (Oregon)  : AZs: us-west-2a 
    use2   US East (Ohio)    : AZs: us-east-2a
    euw3   Europe (Paris)    : AZs: eu-west-3a
    syd2   AsiaPac(Sydney)   : AZs: ap-southeast-2b

VPCs specifics (2 per region, following this pattern):
    First VPC:
    cidr:     192.168.0.0/16
    subnet 1: 192.168.1.0/24 - public
    subnet 2: 192.168.2.0/24 - private
    
    Second VPC:
    cidr:     192.168.0.0/16
    subnet 1: 192.168.3.0/24 - public
    subnet 2: 192.168.4.0/24 - private

    ... same pattern for subsequent VPCs/Regions. 




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
