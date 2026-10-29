
variable "creation_token" {
  type        = string
  description = "Unique creation token for the EFS file system"
}

variable "encrypted" {
  type        = bool
  description = "Whether to encrypt the EFS file system"
}

variable "performance_mode" {
  type        = string
  description = "Performance mode of the EFS file system"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode of the EFS file system"
}

variable "transition_to_ia" {
  type        = string
  description = "When files transition to Infrequent Access storage"
}

variable "transition_to_primary_storage_class" {
  type        = string
  description = "When files transition back to the primary storage class"
}

variable "name" {
  type        = string
  description = "Name tag for the EFS file system"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "A list of private subnet IDs where EFS mount targets should be plugged in"
}

variable "efs_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs allowed to guard the EFS mount target plugs"
}

