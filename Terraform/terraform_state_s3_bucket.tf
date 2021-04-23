/*
S3 Bucket Configuration for storing sensitive tfstate files
*/
resource "aws_s3_bucket" "terraform_state" {
  bucket = "save-cu-terraform-state"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
