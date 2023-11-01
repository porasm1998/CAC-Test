// This tempate will create S3 and Dynamodb gateway endpoints.

//Create S3 Gateway Endpoint
resource "aws_vpc_endpoint" "vpc-s3" {
  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids   = [var.private_rt_id]
  tags              = var.vpc_s3_endpoint_tags
}

//Create Dynamodb Gateway Endpoint
resource "aws_vpc_endpoint" "private-dynamodb" {
  vpc_id           = var.vpc_id
  service_name     = "com.amazonaws.${var.aws_region}.dynamodb"
  route_table_ids  = [var.private_rt_id]
  tags              = var.vpc_dynamodb_endpoint_tags
}