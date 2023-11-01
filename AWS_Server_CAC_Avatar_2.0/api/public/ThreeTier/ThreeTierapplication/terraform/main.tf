module "threetier" {
  source                         = "./three_tier"
  vpc_cidr_block                 = var.vpc_cidr_block
  vpc_Name                       = var.vpc_Name
  web-subnet-1_cidr_block        = var.web-subnet-1_cidr_block
  web-subnet-2_cidr_block        = var.web-subnet-2_cidr_block
  web-subnet-1_Name              = var.web-subnet-1_Name
  web-subnet-2_Name              = var.web-subnet-2_Name
  web-subnet-1_availability_zone = var.web-subnet-1_availability_zone
  web-subnet-2_availability_zone = var.web-subnet-2_availability_zone

  app-subnet-1_cidr_block        = var.app-subnet-1_cidr_block
  app-subnet-2_cidr_block        = var.app-subnet-2_cidr_block
  app-subnet-1_Name              = var.app-subnet-1_Name
  app-subnet-2_Name              = var.app-subnet-2_Name
  app-subnet-1_availability_zone = var.app-subnet-1_availability_zone
  app-subnet-2_availability_zone = var.app-subnet-2_availability_zone

  db-subnet-1_cidr_block        = var.db-subnet-1_cidr_block
  db-subnet-2_cidr_block        = var.db-subnet-2_cidr_block
  db-subnet-1_Name              = var.db-subnet-1_Name
  db-subnet-2_Name              = var.db-subnet-2_Name
  db-subnet-1_availability_zone = var.db-subnet-1_availability_zone
  db-subnet-2_availability_zone = var.db-subnet-2_availability_zone

  web_ami_id        = var.web_ami_id
  web_instance_type = var.web_instance_type
  key_name          = var.key_name

  app_ami_id        = var.app_ami_id
  app_instance_type = var.app_instance_type

  db_ami_id        = var.db_ami_id
  db_instance_type = var.db_instance_type

  bucket_name = var.bucket_name
  

}



