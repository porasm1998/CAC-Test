module "ecs" {
  source = "./modules"
  instance_type        = var.instance_type
  family_type              = var.family_type
  ecs_service_name     = var.ecs_service_name
  cluster_name             = var.cluster_name
  scheduling_strategy  = var.scheduling_strategy
  ecs_service_count        = var.ecs_service_count
  maximum_scaling = var.maximum_scaling
  minimum_scaling = var.minimum_scaling
  status                    = var.status
  target_capacity_count           = var.target_capacity_count
  cap_prov = var.cap_prov
  asg_name = var.asg_name
  desired_capacity_count = var.desired_capacity_count
  asg_min_size=var.asg_min_size
  asg_max_size=var.asg_max_size
  health_check=var.health_check
  //containers_tag = var.containers_tag
  web_server_image=var.web_server_image
  db_server_image=var.db_server_image
  image_id = var.image_id
  availability_zones = var.availability_zones
}