// This module will create EC2 instance and new security group for EC2 instance with ssh and http inbound rules
module "ec2_instance" {
  source        = "./module"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  tagname       = var.tagname

}