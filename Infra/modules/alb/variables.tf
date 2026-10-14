```hcl
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB and target group will be created"
  type        = string
}

variable "alb_internal" {
  description = "Whether the ALB is internal or internet-facing"
  type        = bool
}

variable "alb_type" {
  description = "Type of load balancer to create"
  type        = string
}

variable "alb_security_group_ids" {
  description = "List of security group IDs attached to the ALB"
  type        = list(string)
}

variable "alb_subnet_ids" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
}

variable "target_group_port" {
  description = "Port on which targets receive traffic"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol used to communicate with targets"
  type        = string
}

variable "target_type" {
  description = "Type of target registered with the target group, such as ip or instance"
  type        = string
}

variable "health_check_path" {
  description = "URL path used by the health check"
  type        = string
}

variable "health_check_port" {
  description = "Port used for the health check; traffic-port uses the target group's port"
  type        = string
}

variable "health_check_protocol" {
  description = "Protocol used for health checks"
  type        = string
}

variable "healthy_threshold" {
  description = "Number of consecutive successful health checks required to mark a target healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "Number of consecutive failed health checks required to mark a target unhealthy"
  type        = number
}

variable "health_check_timeout" {
  description = "Time in seconds to wait for a health check response"
  type        = number
}

variable "health_check_interval" {
  description = "Approximate interval in seconds between health checks"
  type        = number
}

variable "health_check_matcher" {
  description = "HTTP response codes considered successful by the health check"
  type        = string
}

variable "http_listener_port" {
  description = "Port used by the HTTP listener"
  type        = number
}

variable "http_listener_protocol" {
  description = "Protocol used by the HTTP listener"
  type        = string
}

variable "https_listener_port" {
  description = "Port used by the HTTPS listener"
  type        = number
}

variable "https_listener_protocol" {
  description = "Protocol used by the HTTPS listener"
  type        = string
}

variable "redirect_status_code" {
  description = "HTTP redirect response code used to redirect clients to HTTPS"
  type        = string
}

variable "ssl_policy" {
  description = "SSL/TLS security policy applied to the HTTPS listener"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate used by the HTTPS listener"
  type        = string
}

