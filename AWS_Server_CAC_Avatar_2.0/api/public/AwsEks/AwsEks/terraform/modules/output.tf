output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "clusterarn" {
  value = aws_eks_cluster.example.arn
}

output "vpcid" {
    description = "vpc id"
    value = aws_vpc.main.id
}

output "vpcarn" {
    description = "vpc id"
    value = aws_vpc.main.arn
}

output "subnet1" {
    description = "subnet arn"
    value = aws_subnet.subnet1.arn
}

output "subnet2" {
    description = "subnet arn"
    value = aws_subnet.subnet2.arn
}

output "subnet3" {
    description = "subnet arn"
    value = aws_subnet.subnet3.arn
}

output "s3_endpoint_id" {
    value = aws_vpc_endpoint.s3.id
}

output "s3_endpoint_arn" {
    value = aws_vpc_endpoint.s3.arn
}

output "nogdegrouparn" {
    value = aws_eks_node_group.example.arn
}

output "nat_gateway_id" {
    value = aws_nat_gateway.example.id
}