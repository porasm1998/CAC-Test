

prefix      = "iac"
usecase     = "aws-foundation"
environment = "dev"

aws_region = "us-west-2"

# VPC
cidr_block1 = "10.0.0.0/16"

# Web Server Subnets ---> Public Subnets
subnet_cidr_1       = "10.0.1.0/24"
subnet_cidr_4       = "10.0.4.0/24"

# App Server Subnets ---> Private Subnets
subnet_cidr_2       = "10.0.2.0/24"
subnet_cidr_5       = "10.0.5.0/24"

# DB Server Subnets ---> Private Subnets
subnet_cidr_3       = "10.0.3.0/24"
subnet_cidr_6       = "10.0.6.0/24"

availability_zone = "us-west-2a"