variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "task_definition_family" {
  description = "Family name of the ECS task definition"
  type        = string
}

variable "task_cpu" {
  description = "CPU allocated to the ECS task"
  type        = number
}

variable "task_memory" {
  description = "Memory allocated to the ECS task in MiB"
  type        = number
}

variable "execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}
variable "operating_system_family" {
  description = "Operating system used by the Gatus task"
  type        = string
}

variable "cpu_architecture" {
  description = "CPU architecture used by the Gatus task"
  type        = string
}


variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}


variable "container_name" {
  description = "Name of the application container"
  type        = string
}

variable "container_cpu" {
  description = "CPU allocated to the container"
  type        = number
}

variable "container_memory" {
  description = "Memory allocated to the container in MiB"
  type        = number
}

variable "container_essential" {
  description = "Whether the container is essential to the task"
  type        = bool
}

variable "container_port" {
  description = "Port used by the application container"
  type        = number
}

variable "container_protocol" {
  description = "Protocol used by the container port"
  type        = string
}

variable "efs_volume_name" {
  description = "Name of the EFS volume"
  type        = string
}

variable "efs_container_path" {
  description = "Path inside the container where EFS is mounted"
  type        = string
}

variable "efs_file_system_id" {
  description = "ID of the EFS file system"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "desired_task_count" {
  description = "Number of ECS tasks the service should run"
  type        = number
}

variable "fargate_platform_version" {
  description = "Fargate platform version"
  type        = string
}

variable "capacity_provider" {
  description = "ECS capacity provider used by the service"
  type        = string
}

variable "capacity_provider_weight" {
  description = "Relative weight of the capacity provider"
  type        = number
}

variable "capacity_provider_base" {
  description = "Minimum number of tasks assigned to the capacity provider"
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID attached to ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}