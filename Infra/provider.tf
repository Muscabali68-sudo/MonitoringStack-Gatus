terraform {
  required_version = ">= 1.15.6"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}



terraform {
  backend "s3" {
    bucket = "muscab-gatus-bucket"

    key          = "infra/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}


provider "aws" {
  region = "eu-central-1"
} 