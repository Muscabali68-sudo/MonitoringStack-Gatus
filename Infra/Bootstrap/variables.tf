variable "bucket_name" {
  type        = string
  default     = "Gatus-bucket"
  description = "Name of the S3 bucket"
}

variable name_tag {
  type        = string
  default     = "Terraform-state"
  description = "description"
}

#-----------------------------

variable "repository_name" {
    type        = string
    default     = "Gatus_repo"
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


