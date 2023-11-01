// vpc----------------------------------------------
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_Name
  }
}

// web subnets-------------------------------------
resource "aws_subnet" "web-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web-subnet-1_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.web-subnet-1_availability_zone
  tags = {
    Name = var.web-subnet-1_Name
  }
}

resource "aws_subnet" "web-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web-subnet-2_cidr_block
  map_public_ip_on_launch = true
  availability_zone = var.web-subnet-2_availability_zone
  tags = {
    Name = var.web-subnet-2_Name
  }
}

//app subnets-------------------------------------
resource "aws_subnet" "app-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app-subnet-1_cidr_block
  availability_zone = var.app-subnet-1_availability_zone
  tags = {
    Name = var.app-subnet-1_Name
  }
}

resource "aws_subnet" "app-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app-subnet-2_cidr_block
  availability_zone = var.app-subnet-2_availability_zone
  tags = {
    Name = var.app-subnet-2_Name
  }
}

//db subnets-------------------------------------------------
resource "aws_subnet" "db-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db-subnet-1_cidr_block
  availability_zone = var.db-subnet-1_availability_zone
  tags = {
    Name = var.db-subnet-1_Name
  }
}

resource "aws_subnet" "db-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db-subnet-2_cidr_block
  availability_zone = var.db-subnet-2_availability_zone
  tags = {
    Name = var.db-subnet-2_Name
  }
}

// internet gateway -----------------------------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_Name}-igw"
  }
}

//route table ------------------------------------------------------------

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "web1" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "web2" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.example.id
}

// security groups -------------------------------------------------------

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "web security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "app security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }

  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "app-sg"
  }
}

resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  description = "db security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "DB"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "db-sg"
  }
}

//virtual machines -------------------------------------------------------------

resource "aws_instance" "web1" {
  ami                         = var.web_ami_id
  instance_type               = var.web_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.web-sg.id]
  subnet_id                   = aws_subnet.web-subnet-1.id
  associate_public_ip_address = var.associate_public_ip_address
  tags 				          = {
      Name = "Webserver-1"
      
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

resource "aws_instance" "web2" {
  ami                         = var.web_ami_id
  instance_type               = var.web_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.web-sg.id]
  subnet_id                   = aws_subnet.web-subnet-2.id
  associate_public_ip_address = var.associate_public_ip_address
  tags 				          = {
      Name = "Webserver-2"
     
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

// Creating ebs volume
resource "aws_ebs_volume" "web1_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.web-subnet-1_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}
resource "aws_ebs_volume" "web2_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.web-subnet-2_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}

// Attaching ebs volume
resource "aws_volume_attachment" "web1_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.web1_ebs_volume[0].id  
  instance_id = aws_instance.web1.id   
  depends_on  = [aws_ebs_volume.web1_ebs_volume]
}
resource "aws_volume_attachment" "web2_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.web2_ebs_volume[0].id  
  instance_id = aws_instance.web2.id   
  depends_on  = [aws_ebs_volume.web2_ebs_volume]
}

// Creates the application Load Balancer
resource "aws_lb" "alb" {  
  name                             = var.alb_name
  load_balancer_type               = var.load_balancer_type
  subnets                          = [aws_subnet.web-subnet-1.id , aws_subnet.web-subnet-2.id]  
  internal                         = var.internal
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
}

// A listener is a process that checks for connection requests, using the protocol and port that you configured.
resource "aws_lb_listener" "alb_listener" {  
  load_balancer_arn  = aws_lb.alb.arn
  protocol           = var.protocol
  port               = var.port
  default_action {
    type             = var.alb_listener_type
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

// Creates the target-group
resource "aws_lb_target_group" "alb_target_group" {   
  name        = var.target_group_name
  target_type = var.target_type
  port        = var.port
  protocol    = var.protocol
  vpc_id      = aws_vpc.main.id
   health_check {
    protocol  = var.protocol
    port      = var.health_check_port

  # ALBs required to use same healthy and unhealthy thresholds
  healthy_threshold   = var.health_check_healthy_threshold
  unhealthy_threshold = var.health_check_unhealthy_threshold

  # Interval between health checks required to be 10 or 30
  interval = var.health_check_interval

  }
}

// Attach the target groups to the instance(s)
resource "aws_lb_target_group_attachment" "ec2_instance1" {
  
  target_group_arn   = aws_lb_target_group.alb_target_group.arn
  target_id          = "${aws_instance.web1.id}"
  port               = var.ec2_port
}
resource "aws_lb_target_group_attachment" "ec2_instance2" {
  
  target_group_arn   = aws_lb_target_group.alb_target_group.arn
  target_id          = "${aws_instance.web2.id}"
  port               = var.ec2_port
}


// 2nd tier

resource "aws_instance" "app1" {
  ami                         = var.app_ami_id
  instance_type               = var.app_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.app-sg.id]
  subnet_id                   = aws_subnet.app-subnet-1.id
  
  tags 				          = {
      Name = "appserver-1"
      
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

resource "aws_instance" "app2" {
  ami                         = var.app_ami_id
  instance_type               = var.app_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.app-sg.id]
  subnet_id                   = aws_subnet.app-subnet-2.id
  
  tags 				          = {
      Name = "appserver-2"
     
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

// Creating ebs volume
resource "aws_ebs_volume" "app1_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.app-subnet-1_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}
resource "aws_ebs_volume" "app2_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.app-subnet-2_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}

// Attaching ebs volume
resource "aws_volume_attachment" "app1_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.app1_ebs_volume[0].id  
  instance_id = aws_instance.app1.id   
  depends_on  = [aws_ebs_volume.app1_ebs_volume]
}
resource "aws_volume_attachment" "app2_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.app2_ebs_volume[0].id  
  instance_id = aws_instance.app2.id   
  depends_on  = [aws_ebs_volume.app2_ebs_volume]
}

// Creates the application Load Balancer
resource "aws_lb" "nlb" {  
  name                             = var.nlb_name
  load_balancer_type               = var.n_load_balancer_type
  subnets                          = [aws_subnet.app-subnet-1.id , aws_subnet.app-subnet-2.id]  
  internal                         = var.n_internal
  enable_cross_zone_load_balancing = var.n_enable_cross_zone_load_balancing
  enable_deletion_protection       = var.n_enable_deletion_protection
}

// A listener is a process that checks for connection requests, using the protocol and port that you configured.
resource "aws_lb_listener" "nlb_listener" {  
  load_balancer_arn  = aws_lb.nlb.arn
  protocol           = var.n_protocol
  port               = var.n_port
  default_action {
    type             = var.nlb_listener_type
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
  }
}

// Creates the target-group
resource "aws_lb_target_group" "nlb_target_group" {   
  name        = var.n_target_group_name
  target_type = var.n_target_type
  port        = var.n_port
  protocol    = var.n_protocol
  vpc_id      = aws_vpc.main.id
   health_check {
    protocol  = var.n_protocol
    port      = var.n_health_check_port

  # ALBs required to use same healthy and unhealthy thresholds
  healthy_threshold   = var.n_health_check_healthy_threshold
  unhealthy_threshold = var.n_health_check_unhealthy_threshold

  # Interval between health checks required to be 10 or 30
  interval = var.n_health_check_interval

  }
}

// Attach the target groups to the instance(s)
resource "aws_lb_target_group_attachment" "ec2_instance3" {
  
  target_group_arn   = aws_lb_target_group.nlb_target_group.arn
  target_id          = "${aws_instance.app1.id}"
  port               = var.n_ec2_port
}
resource "aws_lb_target_group_attachment" "ec2_instance4" {
  
  target_group_arn   = aws_lb_target_group.nlb_target_group.arn
  target_id          = "${aws_instance.app2.id}"
  port               = var.n_ec2_port
}

//third tier

resource "aws_instance" "db1" {
  ami                         = var.db_ami_id
  instance_type               = var.db_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.db-sg.id]
  subnet_id                   = aws_subnet.db-subnet-1.id
  
  tags 				          = {
      Name = "dbserver-1"
      
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

resource "aws_instance" "db2" {
  ami                         = var.db_ami_id
  instance_type               = var.db_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.db-sg.id]
  subnet_id                   = aws_subnet.db-subnet-2.id
  
  tags 				          = {
      Name = "dbserver-2"
     
  }
  /* user_data  = filebase64("${path.module}/apache.sh")
  root_block_device {
    encrypted   = var.root_block_device_encrypted
  } */
}

// Creating ebs volume
resource "aws_ebs_volume" "db1_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.db-subnet-1_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}
resource "aws_ebs_volume" "db2_ebs_volume" {
  count = var.Create_ebs == true ? 1 : 0
  availability_zone = "${var.db-subnet-2_availability_zone}"
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted
}

// Attaching ebs volume
resource "aws_volume_attachment" "db1_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.db1_ebs_volume[0].id  
  instance_id = aws_instance.db1.id   
  depends_on  = [aws_ebs_volume.db1_ebs_volume]
}
resource "aws_volume_attachment" "db2_ebs_vol_attachment" {
  count = var.Create_ebs == true ? 1 : 0
  device_name = var.ebs_volume_name
  volume_id   = aws_ebs_volume.db2_ebs_volume[0].id  
  instance_id = aws_instance.db2.id   
  depends_on  = [aws_ebs_volume.db2_ebs_volume]
}

//s3 bucket

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    
  }
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "aws/s3"
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_eip" "example" {
  domain ="vpc"
}
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.web-subnet-1.id

  tags = {
    Name = "${var.vpc_Name}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "natgwroute" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "natgwroute1" {
  subnet_id      = aws_subnet.app-subnet-1.id
  route_table_id = aws_route_table.natgwroute.id
}

resource "aws_route_table_association" "natgwroute2" {
  subnet_id      = aws_subnet.app-subnet-2.id
  route_table_id = aws_route_table.natgwroute.id
}