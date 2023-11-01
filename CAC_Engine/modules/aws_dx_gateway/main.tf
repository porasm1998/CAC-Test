resource "aws_dx_gateway" "dx_gateway" {
  name            = var.direct_connection_gateway
  amazon_side_asn = var.amazon_side_asn
}