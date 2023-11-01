
resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = var.availability_zone_subnet[count.index]
  tags = {
      Name = var.Nametag[count.index]
      
  }
  count = length(var.subnet_cidr)
}