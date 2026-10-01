variable "repository_name" {
    type        = string
    description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
    type        = string
    description = "Controls whether image tags can be overwritten"
}

variable "force_delete" {
    type        = bool
    description = "Allow deletion of the ECR repository when it contains images"
}

variable "scan_on_push" {
    type        = bool
    description = "Scan Image on push"
}


variable "encryption_type" {
    type        = string
    description = "Encryption type used for images in the ECR repository"
}
