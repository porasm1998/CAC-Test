// Display resource ids, name and arn

output "route_table_association_id" {
  description = "aws route table association id"
  value       = aws_route_table_association.web2.id
}
