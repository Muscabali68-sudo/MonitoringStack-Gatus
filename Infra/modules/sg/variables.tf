
variable vpc_id {

 type         = string
 description  = "Gatus vpc id"
}


variable alb_sg_name {
  type        = string
  description = "Name of the ALB security group"
}

variable "alb_ingress_cidr" {
  type        = string
  description = "IPv4 CIDR block allowed to reach the ALB"
}


variable "http_port" {
  type        = number
  description = "Port used for HTTP traffic"
}

variable tcp_protocol {
  type        = string
  description = " tcp protocol that controls how data travels across a network"
}



variable "https_port" {
  type        = number
  description = "Port used for HTTPS traffic"
}

variable application_port {
  type        = number
  description = "Port used by the Gatus application"
}

variable alb_sg_description {
  type        = string
  description = "Description of the ALB security group"
}


#-----------------------


variable ecs_sg_name {
  type        = string
  description = "Name of the ECS task security group"
}



variable ecs_sg_description {
  type        = string
  description = "Description of the ECS task security group"
}

variable efs_port {
  type        = string
  description = "Port used by EFS for NFS traffic"
}

#---------------------------

variable efs_sg_name {
  type        = string
  description = "Name of the EFS security group"
}

variable efs_sg_description {
  type        = string
  description = "Description of the EFS security group"
}












