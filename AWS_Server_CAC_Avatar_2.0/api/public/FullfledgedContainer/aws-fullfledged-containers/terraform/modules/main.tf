resource "aws_launch_configuration" "ecs_launch_config"{
  image_id = var.image_id
  instance_type= var.instance_type

}

resource "aws_autoscaling_group" "ecs_asg" {
  name = var.asg_name
  launch_configuration=aws_launch_configuration.ecs_launch_config.name
  desired_capacity= var.desired_capacity_count
  min_size=var.asg_min_size
  max_size=var.asg_max_size
  health_check_type=var.health_check
  availability_zones = var.availability_zones
  depends_on = [aws_launch_configuration.ecs_launch_config]
}


resource "aws_ecs_capacity_provider" "cap_prov" {
  name = aws_ecs_cluster.my_cluster.name
  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.ecs_asg.arn
    

    managed_scaling {
      maximum_scaling_step_size = var.maximum_scaling
      minimum_scaling_step_size = var.minimum_scaling
      status                    = var.status
      target_capacity           = var.target_capacity_count
    }
  }
}

resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_name
  //capacity_providers = [aws_ecs_capacity_provider.cap_prov.name]
}

resource "aws_ecs_service" "ecs_container" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.task1.arn
  scheduling_strategy = var.scheduling_strategy
  desired_count   = var.ecs_service_count
  launch_type     = "EC2"
  
}
resource "aws_ecs_task_definition" "task1" {
  family = var.family_type

  container_definitions = jsonencode([
    {
      name      = "db"
      image     = "${var.web_server_image}"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    {
      name      = "web"
      image     = "${var.db_server_image}"
      cpu       = 10
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a, us-east-2b]"
  }
}

