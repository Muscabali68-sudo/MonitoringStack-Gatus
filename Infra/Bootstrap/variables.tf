variable "bucket_name" {
  type        = string
  default     = "muscab-gatus-bucket"
  description = "Name of the S3 bucket"
}


#-----------------------------

variable "repository_name" {
  type        = string
  default     = "gatus_repo"
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "Controls whether image tags can be overwritten"
}

variable "force_delete" {
  type        = bool
  default     = true
  description = "Allow deletion of the ECR repository when it contains images"
}

variable "scan_on_push" {
  type        = bool
  default     = true
  description = "Scan Image on push"
}


variable "encryption_type" {
  type        = string
  default     = "AES256"
  description = "Encryption type used for images in the ECR repository"
}


#-------------------------------------


variable "name_tag" {
  type        = string
  description = "Name tag OIDC provider"
  default     = "gatus_monitoringStack"
}

variable "build_push_role_name" {
  type        = string
  description = "Name of the build-and-push role"
  default     = "gatus_build_pushRole"
}

variable "build_push_policy_name" {
  type        = string
  description = "Name of the build-and-push permissions policy"
  default     = "gatus_build_push_policy"
}


variable "deployment_role_name" {
  type        = string
  description = "Name of the deployment role"
  default     = "gatus_deploymentrole"
}

variable "deployment_policy_name" {
  type        = string
  description = "Name of the deployment permissions policy"
  default     = "gatus_deployment_policy"
}



