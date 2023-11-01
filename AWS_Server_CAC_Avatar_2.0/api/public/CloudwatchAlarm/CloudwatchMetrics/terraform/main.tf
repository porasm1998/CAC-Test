module "cloudwatchmetric" {
    source = "./module/aws-cloudwatchmetrics"
    alarm_name = var.alarm_name
    comparison_operator = var.comparison_operator
    evaluation_periods = var.evaluation_periods
    metric_name = var.metric_name
    namespace = var.namespace
    period = var.period
    statistic = var.statistic
    threshold = var.threshold
    alarm_description = var.alarm_description
    sns_arn = var.sns_arn
    InstanceId = var.InstanceId
}