module "cloudwatch" {
    source                     = "./modules/aws-cloudwatch"
    cloudwatch_log_name = var.cloudwatch_log_name
    log_stream_name = var.log_stream_name
}