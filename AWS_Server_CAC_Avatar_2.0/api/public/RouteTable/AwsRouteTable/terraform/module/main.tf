resource "aws_route_table" "aws_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr_block
   gateway_id = var.internet_gateway_id
  }
}