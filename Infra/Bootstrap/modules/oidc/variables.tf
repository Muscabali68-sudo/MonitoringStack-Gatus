variable name_tag {
  type        = string
  description = "Name tag OIDC provider"
}

variable build_push_role_name {
  type        = string
  description = "Name of the build-and-push role"
}

variable build_push_policy_name  {
  type        = string
  description = "Name of the build-and-push permissions policy"
}

variable ecr_repository_arn {
  type        = string
  description = "ARN of the ECR repository"
}


variable deployment_role_name {
  type        = string
  description = "Name of the deployment role"
}

variable deployment_policy_name {
  type        = string
  description = "Name of the deployment permissions policy"
}


variable bucker_arn {
  type        = string
  description = "ARN of the S3 Terraform state bucket"
}







