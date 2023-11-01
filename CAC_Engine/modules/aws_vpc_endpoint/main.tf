
resource "aws_vpc_endpoint" "s3" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.private_dns_enabled
  tags                = var.tags 

}