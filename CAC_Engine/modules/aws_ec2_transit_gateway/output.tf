output "tg_id" {
  description = "aws transit gateway creation"
  value       = aws_ec2_transit_gateway.transit_gateway.id
}