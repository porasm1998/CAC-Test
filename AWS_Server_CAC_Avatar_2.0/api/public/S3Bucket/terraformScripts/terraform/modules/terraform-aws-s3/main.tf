# S3 Bucket

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"

  tags   =  var.s3_tags
}