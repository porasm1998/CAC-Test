data "aws_vpc" "vpc1" {
  id = var.vpc_id
}

resource "aws_security_group" "allow_tls" {
  name        = var.security_group
  description = var.description1
  vpc_id      = data.aws_vpc.vpc1.id

  ingress {
    description = var.description2
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = [data.aws_vpc.vpc1.cidr_block]

  }

  egress {
    description = var.description3
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_block
  }

  tags = var.tags

}