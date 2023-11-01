module "awsconfig" {
    source = "./modules/aws-config"
    name = var.name
    s3_bucket = var.s3_bucket
    policy_arn = var.policy_arn
    rules = var.rules
}