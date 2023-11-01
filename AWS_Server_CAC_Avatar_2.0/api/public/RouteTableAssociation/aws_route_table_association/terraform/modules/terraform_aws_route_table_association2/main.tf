
resource "aws_route_table_association" "web2" {
  subnet_id      = var.rt_subnet_id
  route_table_id = var.rt_route_table_id
}
