output "cluster_endpoint" {
  value = module.ekscluster.cluster_endpoint
}

output "clusterarn" {
  value = module.ekscluster.clusterarn
}

output "vpcid" {
    description = "vpc id"
    value = module.ekscluster.vpcid
}
output "vpcarn" {
    description = "vpc id"
    value = module.ekscluster.vpcarn
}

output "subnet1" {
    description = "subnet arn"
    value = module.ekscluster.subnet1
}

output "subnet2" {
    description = "subnet arn"
    value = module.ekscluster.subnet2
}

output "subnet3" {
    description = "subnet arn"
    value = module.ekscluster.subnet3
}

output "s3_endpoint_id" {
    value = module.ekscluster.s3_endpoint_id
}

output "s3_endpoint_arn" {
    value = module.ekscluster.s3_endpoint_arn
}

output "nogdegrouparn" {
    value = module.ekscluster.nogdegrouparn
}

output "nat_gateway_id" {
    value = module.ekscluster.nat_gateway_id
}