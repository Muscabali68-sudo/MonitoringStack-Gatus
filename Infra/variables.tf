#Vpc Variables

#vpc module call
variable "vpc_name" {
  type        = string
  description = "Name tag applied to the VPC"
  default     = "Gatus_vpc"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}


variable "dns_support" {
  type        = bool
  description = "Enable DNS support inside the VPC"
  default     = true
}

variable "dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames inside the VPC"
  default     = true
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}


variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "internet_gateway_name" {
  type        = string
  description = "Internet gateway"
  default     = "Gatus_igw"
}


variable "nat_gateway_name" {
  type        = string
  description = "Name of the natgateway"
  default     = "Reginoal_nat_gateway"
}


variable "availability_mode" {
  type        = string
  description = "availability mode"
  default     = "regional"
}

variable "connectivity_type" {
  type        = string
  description = "Connectivity type of the NAT Gateway"
  default     = "public"
}


variable "public_route_cidr_block" {
  type        = string
  description = "Name of the public route table"
  default     = "0.0.0.0/0"
}

variable "public_route_table_name" {
  type        = string
  description = "Destination CIDR block public"
  default     = "Gatus_public_rt"
}


variable "private_route_table_name" {
  type        = string
  description = "Name of the private route table"
  default     = "Gatus_private_rt"
}

variable "private_route_cidr_block" {
  type        = string
  description = "Destination CIDR block private"
  default     = "0.0.0.0/0"
}


#Sg variables

variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
  default     = "Gatus_Alb_Sg"
}

variable "alb_ingress_cidr" {
  type        = string
  description = "IPv4 CIDR block allowed to reach the ALB"
  default     = "0.0.0.0/0"
}


variable "http_port" {
  type        = number
  description = "Port used for HTTP traffic"
  default     = "80"
}

variable "tcp_protocol" {
  type        = string
  description = "tcp protocol that controls how data travels across a network"
  default     = "tcp"
}


variable "https_port" {
  type        = number
  description = "Port used for HTTPS traffic"
  default     = "443"
}

variable "application_port" {
  type        = number
  description = "Port used by the Gatus application"
  default     = "8080"
}

variable "alb_sg_description" {
  type        = string
  description = "Description of the ALB security group"
  default     = "Controls traffic for the Gatus Application Load Balancer"
}

variable "ip-protocol-1" {
  type        = string
  description = "Contains -1 as ip protocol"
  default     = "-1"
}

variable "ecs_outbound_cidr" {
  type        = string
  description = "IPv4 CIDR block allowed for ECS outbound traffic"
  default     = "0.0.0.0/0"
}


#-----------------------


variable "ecs_sg_name" {
  type        = string
  description = "Name of the ECS task security group"
  default     = "Gatus_Ecs_Sg"
}



variable "ecs_sg_description" {
  type        = string
  description = "Description of the ECS task security group"
  default     = "Controls traffic for the Gatus ECS tasks"
}
#---------------------------


variable "efs_port" {
  type        = string
  description = "Port used by EFS for NFS traffic"
  default     = "2049"
}


variable "efs_sg_name" {
  type        = string
  description = "Name of the EFS security group"
  default     = "Gatus_Efs_Sg"
}

variable "efs_sg_description" {
  type        = string
  description = "Description of the EFS security group"
  default     = "Controls traffic to the Gatus EFS file system"
}


#Alb variables


variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "gatus-alb"
}


variable "alb_internal" {
  description = "Whether the ALB is internal or internet-facing"
  type        = bool
  default     = false
}

variable "alb_type" {
  description = "Type of load balancer to create"
  type        = string
  default     = "ip"
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
  default     = "gatus-tg"
}

variable "target_group_port" {
  description = "Port on which targets receive traffic"
  type        = number
  default     = "8080"
}

variable "target_group_protocol" {
  description = "Protocol used to communicate with targets"
  type        = string
  default     = "HTTP"
}


variable "health_check_path" {
  description = "URL path used by the health check"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Port used for the health check traffic-port uses the target group's port"
  type        = number
  default     = "8080"
}

variable "health_check_protocol" {
  description = "Protocol used for health checks"
  type        = string
  default     = "HTTP"
}

variable "healthy_threshold" {
  description = "Number of consecutive successful health checks required to mark a target healthy"
  type        = number
  default     = "2"
}

variable "unhealthy_threshold" {
  description = "Number of consecutive failed health checks required to mark a target unhealthy"
  type        = number
  default     = "3"
}

variable "health_check_timeout" {
  description = "Time in seconds to wait for a health check response"
  type        = number
  default     = "5"
}

variable "health_check_interval" {
  description = "Approximate interval in seconds between health checks"
  type        = number
  default     = "30"
}

variable "health_check_matcher" {
  description = "HTTP response codes considered successful by the health check"
  type        = string
  default     = "200-399"
}

variable "http_listener_port" {
  description = "Port used by the HTTP listener"
  type        = number
  default     = "80"
}

variable "http_listener_protocol" {
  description = "Protocol used by the HTTP listener"
  type        = string
  default     = "HTTP"
}

variable "https_listener_port" {
  description = "Port used by the HTTPS listener"
  type        = number
  default     = "443"
}

variable "timeout" {
   description = "health check's timeout"
   type        = number
   default     = "3"    
}

variable "https_listener_protocol" {
  description = "Protocol used by the HTTPS listener"
  type        = string
  default     = "HTTPS"
}

variable "redirect_status_code" {
  description = "HTTP redirect response code used to redirect clients to HTTPS"
  type        = string
  default     = "HTTP_301"
}

variable "ssl_policy" {
  description = "SSL/TLS security policy applied to the HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-Res-PQ-2025-09"
}

#Route 53 variables

variable "hosted_zone_name" {
  description = "Name tag applied to the Route 53 hosted zone"
  type        = string
  default     = "muscabali.co.uk"
}



variable "domain_name" {
  description = "Domain name managed by Route 53"
  type        = string
  default     = "muscabali.co.uk"
}

variable "record_type" {
  description = "description"
  type        = string
  default     = "A"
}

#Acm variables


variable "certificate_name" {
  description = "Name tag applied to the ACM certificate"
  type        = string
  default     = "gatus_acm_certificate"
}

variable "validation_method" {
  description = "Method used to validate the ACM certificate"
  type        = string
  default     = "DNS"
}

variable "validation_record_ttl" {
  description = "TTL for the ACM validation DNS record"
  type        = number
  default     = 300
}





#Iam variables
variable "iam_role_name" {
  type        = string
  description = "Name of the ECS Task Execution Role"
  default     = "Gatus_Execution_Role"
}

variable "policy_arn" {
  type        = string
  description = "Policy_arn"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



#Ecs variables

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "gatus_ecs"
}
variable "ecr_repository_name" {
  type        = string
  default     = "gatus_repo"
  description = "Name of the ECR repository"
}

variable "task_definition_family" {
  description = "Family name of the ECS task definition"
  type        = string
  default     = "gatus_task"
}

variable "task_cpu" {
  description = "CPU allocated to the ECS task"
  type        = number
  default     = "1024"
}

variable "task_memory" {
  description = "Memory allocated to the ECS task in MiB"
  type        = number
  default     = "3072"
}


variable "operating_system_family" {
  description = "Operating system used by the Gatus task"
  type        = string
  default     = "LINUX"
}

variable "cpu_architecture" {
  description = "CPU architecture used by the Gatus task"
  type        = string
  default     = "ARM64"
}


variable "container_name" {
  description = "Name of the application container"
  type        = string
  default     = "Gatus_Main"
}

variable "container_cpu" {
  description = "CPU allocated to the container"
  type        = number
  default     = "1024"
}

variable "container_memory" {
  description = "Memory allocated to the container in MiB"
  type        = number
  default     = "3072"
}

variable "container_essential" {
  description = "Whether the container is essential to the task"
  type        = bool
  default     = true
}

variable "container_port" {
  description = "Port used by the application container"
  type        = number
  default     = "8080"
}

variable "container_protocol" {
  description = "Protocol used by the container port"
  type        = string
  default     = "tcp"
}

variable "efs_volume_name" {
  description = "Name of the EFS volume in the Task Definition"
  type        = string
  default     = "gatus_data"
}

variable "efs_container_path" {
  description = "Path where EFS is mounted inside the Gatus container"
  type        = string
  default     = "/data"
}



variable "ecs_service_name" {
  description = "Name of the Gatus ECS service"
  type        = string
  default     = "service_gatus"
}

variable "desired_task_count" {
  description = "Number of Gatus tasks the ECS service keeps running"
  type        = number
  default     = 1
}

variable "fargate_platform_version" {
  description = "Fargate platform version used by the service"
  type        = string
  default     = "1.4.0"
}

variable "capacity_provider" {
  description = "Capacity provider used by the ECS service"
  type        = string
  default     = "FARGATE"
}

variable "capacity_provider_weight" {
  description = "Relative percentage of tasks assigned to this capacity provider"
  type        = number
  default     = 1
}

variable "capacity_provider_base" {
  description = "Minimum number of tasks assigned to this capacity provider"
  type        = number
  default     = 0
}

#Efs variables

variable "creation_token" {
  type        = string
  description = "Unique creation token for the EFS file system"
  default     = "gatus-efs"
}

variable "encrypted" {
  type        = bool
  description = "Whether to encrypt the EFS file system"
  default     = true
}

variable "performance_mode" {
  type        = string
  description = "Performance mode of the EFS file system"
  default     = "generalPurpose"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode of the EFS file system"
  default     = "elastic"
}

variable "transition_to_ia" {
  type        = string
  description = "When files transition to Infrequent Access storage"
  default     = "AFTER_30_DAYS"
}

variable "transition_to_primary_storage_class" {
  type        = string
  description = "When files transition back to the primary storage class"
  default     = "AFTER_1_ACCESS"
}

variable "name" {
  type        = string
  description = "Name tag for the EFS file system"
  default     = "Gatus_Efs"
}
