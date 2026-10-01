resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name 

  tags = {
    Name        = var.name_tag
  }
} 

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id 

  versioning_configuration {
    status= "Enabled"
  }

  resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule { 
    apply_server_side_encryption-by-default {
        sse_algorithm = AES256
        }
  }

  resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.bucket.id
  
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

