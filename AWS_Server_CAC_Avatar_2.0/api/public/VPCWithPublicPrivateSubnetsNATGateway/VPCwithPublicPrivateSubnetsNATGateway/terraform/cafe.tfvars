# // AWS Lambda function and its components related variable values------------------------------------------------------------
# aws_access_key = "*****************"
# aws_secret_key = "*****************"
# aws_region     = "us-east-1"

# // AWS VPC and its components related variable values---------------------------------------------------------

# cidr_block           = "10.0.0.0/16"

# // Subnets and its componenets realted variables 
# public_subnet_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24"]
# private_subnet_cidr_block = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24","10.0.104.0/24"]
# availability_zone         = ["us-east-2a", "us-east-2b", "us-east-2a", "us-east-2b"]
# eip_count                 = 2

# //web server-> 2az-> 2public Subnets
# //application server-> 2az-> 2 private Subnets
# //database server-> 2az-> 2 private Subnets 