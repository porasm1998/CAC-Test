module "vpc_1" {
  source     = "../../modules/aws_vpc"
  cidr_block = var.cidr_block1
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test01-vpc"
    Environment = "Dev"
  }
}

# Web Server Subnets ---> Public Subnets
module "subnet_1" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test01-subnet"
    Environment = "Dev"
  }
}

module "subnet_4" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_4
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-subnet"
    Environment = "Dev"
  }
}

# App Server Subnets ---> Private Subnets
module "subnet_2" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_2
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test02-subnet"
    Environment = "Dev"
  }
}

module "subnet_5" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_5
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-subnet"
    Environment = "Dev"
  }
}

# DB Server Subnets ---> Private Subnets
module "subnet_3" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_3
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test03-subnet"
    Environment = "Dev"
  }
}

module "subnet_6" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr_6
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-subnet"
    Environment = "Dev"
  }
}