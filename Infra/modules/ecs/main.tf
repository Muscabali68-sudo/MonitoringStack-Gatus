# Creat an ecs cluster

resource "aws_ecs_cluster" "gatus" {
  name = var.ecs_cluster_name
}

data "aws_ecr_repository" "gatus_repo" {
  name = var.ecr_repository_name
}

data "aws_ecr_image" "gatus_image" {
  repository_name = var.ecr_repository_name
  most_recent     = true
}

resource "aws_ecs_task_definition" "gatus" {
  family = var.task_definition_family

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu    = var.task_cpu
  memory = var.task_memory

  execution_role_arn = var.execution_role_arn

    runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = "${data.aws_ecr_repository.gatus_repo.repository_url}@${data.aws_ecr_image.gatus_image.image_digest}"
      cpu       = var.container_cpu
      memory    = var.container_memory
      essential = var.container_essential

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = var.container_protocol
        }
      ]

      mountPoints = [
        {
          sourceVolume  = var.efs_volume_name
          containerPath = var.efs_container_path
          readOnly      = false
        }
      ]
    }
  ])


  volume {
    name = var.efs_volume_name

    efs_volume_configuration {
      file_system_id = var.efs_file_system_id
      root_directory = "/"

      transit_encryption = "ENABLED"

    }
  }
}



# -------------------------ECS-Service------------------------------



resource "aws_ecs_service" "gatus" {
  name = var.ecs_service_name

  cluster          = aws_ecs_cluster.gatus.id
  task_definition  = aws_ecs_task_definition.gatus.arn
  desired_count    = var.desired_task_count
  platform_version = var.fargate_platform_version

  capacity_provider_strategy {
    capacity_provider = var.capacity_provider
    weight            = var.capacity_provider_weight
    base              = var.capacity_provider_base
  }

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.ecs_security_group_id]

    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn

    container_name = var.container_name
    container_port = var.container_port
  }

  tags = {
    Name = var.ecs_service_name
  }
}





