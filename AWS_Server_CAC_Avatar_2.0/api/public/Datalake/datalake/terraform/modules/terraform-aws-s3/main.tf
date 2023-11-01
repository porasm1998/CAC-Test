//This template will create Raw and processed S3 buckets and create three prefixes as per vendor names

//Create new S3 Buckets for Raw

resource "aws_s3_bucket" "raw" {
  bucket                    = var.s3_bucket_raw
  acl                       = var.bucket_acl
  tags                      = var.s3_tags

lifecycle_rule {
    enabled = var.Lifecycle_rule_enabled 
    transition {
      days          = var.glacier_transition_days
      storage_class = var.storage_class
    }
 
  }

}

//Create new S3 Buckets for processed
resource "aws_s3_bucket" "processed" {
  bucket                    = var.s3_bucket_processed
  acl                       = var.bucket_acl
  tags                      = var.s3_tags

lifecycle_rule {
    enabled = var.Lifecycle_rule_enabled 
    transition {
      days          = var.glacier_transition_days
      storage_class = var.storage_class
    }
 
  }
}

// Creation sub folder inside s3 buckets as per vendor names
resource "aws_s3_object" "s3_raw_folders" {
    count  = length(var.s3_gmb_sub_folders)
    bucket = aws_s3_bucket.raw.id
    acl    = var.bucket_acl
    key    = "${var.s3_gmb_sub_folders[count.index]}/"
}

