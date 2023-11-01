
# Internet VPC
resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
 // enable_classiclink   = var.enable_classiclink
  tags                 = var.vpc_tags
}

# Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_block)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_block[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone[count.index]
  tags                    = {
    Name                  = "Public_subnet_${count.index}"
    } 
}

// Private Subnets
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidr_block)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.private_subnet_cidr_block[count.index]
  availability_zone       = var.availability_zone[count.index]
  tags                    = {
    Name                  = "Private_subnet_${count.index}"
  }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id       = aws_vpc.default.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
  tags         = { 
      Name     = "Public_RT"
  }
}

#route associations public
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidr_block)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private route table
resource "aws_route_table" "private" {
  vpc_id     =  aws_vpc.default.id
  route  {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags       = { 
      Name   = "Private_RT"
  }
}

#route associations private
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidr_block)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

// Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "IGW"
  }
}

// create Elastic IP 
resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"
}

// create VPC NAT Gateway.
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "gw NAT"
  }
}

// Create list of elastic ips
resource "aws_eip" "elastic_ip_list" {
  domain   = "vpc"
  count    = var.eip_count 
} 