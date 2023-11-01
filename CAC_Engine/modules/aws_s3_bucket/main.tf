resource "aws_s3_bucket" "s3_bucket" {
  bucket              = var.s3_bucket
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
}