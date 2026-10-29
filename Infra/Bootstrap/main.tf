module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "oidc" {
  source = "./modules/oidc"

  name_tag             = var.name_tag
  build_push_role_name = var.build_push_role_name

  build_push_policy_name = var.build_push_policy_name

  ecr_repository_arn = module.ecr.repository_arn

  deployment_role_name = var.deployment_role_name


  deployment_policy_name = var.deployment_policy_name

  bucket_arn = module.s3.bucket_arn

}

module "ecr" {
  source = "./modules/ecr"

  repository_name      = var.repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete
  scan_on_push         = var.scan_on_push
  encryption_type      = var.encryption_type

}