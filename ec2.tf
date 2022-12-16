# Create EC2 Instances in our VPC/Subnets
#   One instance per subnet

#Public subnet instance 
resource "aws_instance" "ec2-public-subnet" {
    ami             = "ami-094125af156557ca2"
    instance_type   = "t2.micro"
    key_name        = "${aws_key_pair.generated_key.key_name}"
    associate_public_ip_address = true
    subnet_id       = vpc_dc1-vpc_public_snet0
    
    source_dest_check   = false




tags = {
      #Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
}

/*
resource "aws_instance" "wordpress" {
 ami = "ami-03a115bbd6928e698"
 instance_type = "t2.micro"
 key_name = "${aws_key_pair.generated_key.key_name}"
 vpc_security_group_ids = [ "${aws_security_group.sg.id}" ]
 subnet_id = "${aws_subnet.public.id}"
  
 tags = {
  Name = "<Wordpress_instance_name>"
 }
}

resource "aws_instance" "mysql" {
 ami = "ami-04e98b8bcc00d2678"
 instance_type = "t2.micro"
 key_name = "${aws_key_pair.generated_key.key_name}"
 vpc_security_group_ids = [ "${aws_security_group.mysg.id}" ]
 subnet_id = "${aws_subnet.private.id}"
  
 tags = {
  Name = "<MySQL_instance_name>"
 }
}

*/