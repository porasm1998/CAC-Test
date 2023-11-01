// Dispaly resources arn and ids

output "s3_gateway_endpoint_id" {
  value       = aws_vpc_endpoint.vpc-s3.id
  description = "s3 gateway endpoint id"
}

output "s3_gateway_endpoint_arn" {
  value       = aws_vpc_endpoint.vpc-s3.arn
  description = "s3 gateway endpoint arn"
}

output "Dynamodb_gateway_endpoint_id" {
  value       = aws_vpc_endpoint.private-dynamodb.id
  description = "Dynamodb gateway endpoint id"
}

output "Dynamodb_gateway_endpoint_arn" {
  value       = aws_vpc_endpoint.private-dynamodb.arn
  description = "Dynamodb gateway endpoint arn"
}


