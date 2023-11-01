// Dispaly resources names and ids

output "s3-gateway-endpoint-id" {
  value       = module.endpoints.s3_gateway_endpoint_id
  description = "s3 gateway endpoint id"
}

output "s3-gateway-endpoint-arn" {
  value       = module.endpoints.s3_gateway_endpoint_arn
  description = "s3 gateway endpoint arn"
}

output "Dynamodb-gateway-endpoint-id" {
  value       = module.endpoints.Dynamodb_gateway_endpoint_id
  description = "Dynamodb gateway endpoint id"
}

output "Dynamodb-gateway-endpoint-arn" {
  value       = module.endpoints.Dynamodb_gateway_endpoint_arn
  description = "Dynamodb gateway endpoint arn"
}
