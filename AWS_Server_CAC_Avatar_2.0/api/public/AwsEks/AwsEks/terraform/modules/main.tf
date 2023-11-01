resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
   tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr_block
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.cluster_name}-private-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_cidr_block
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.cluster_name}-private-subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3_cidr_block
  availability_zone = var.availability_zone3
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.cluster_name}-public-subnet3"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "${var.cluster_name}-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.cluster_name}-security-group"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.cluster_name}-ig"
  }
}

resource "aws_eip" "nat_eip" {
  domain        = "vpc"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet3.id
  tags = {
    Name = "${var.cluster_name}-natgw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "example1" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.cluster_name}-rt1"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.example1.id
}

resource "aws_route_table" "example2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = "${var.cluster_name}-rt1"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.example2.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.example2.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}

resource "aws_eks_cluster" "example" {
  name     = var.cluster_name
  version  = var.eks_version 
  role_arn = aws_iam_role.eksrole.arn
  vpc_config {
    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access = var.endpoint_public_access
    security_group_ids = [aws_security_group.allow_tls.id]
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eksrole-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eksrole-AmazonEKSVPCResourceController,
  ]
}

resource "aws_iam_role" "eksrole" {
  name = "${var.cluster_name}-eks-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eksrole-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eksrole.name
}

resource "aws_iam_role_policy_attachment" "eksrole-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eksrole.name
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.nodegrouprole.arn
  subnet_ids      = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet2.id]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.nodegrouprole-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodegrouprole-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodegrouprole-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "nodegrouprole" {
  name = "${var.cluster_name}-nodegroup-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodegrouprole-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodegrouprole.name
}

resource "aws_iam_role_policy_attachment" "nodegrouprole-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodegrouprole.name
}

resource "aws_iam_role_policy_attachment" "nodegrouprole-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodegrouprole.name
}