resource "aws_instance" "web" {
 # ami           = data.aws_ami.ubuntu.id
  ami = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.tagname
    
  }
}
