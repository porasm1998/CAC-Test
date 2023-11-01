resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = var.alarm_name #"alarmname"
  comparison_operator = var.comparison_operator #"LessThanThreshold"
  evaluation_periods  = var.evaluation_periods #1
  metric_name         = var.metric_name #"HealthyHostCount"
  namespace           = var.namespace #"AWS/NetworkELB"
  period              = var.period #60
  statistic           = var.statistic #"Average"
  threshold           = var.threshold
  alarm_description   = var.alarm_description #"Number of healthy nodes in Target Group"
  actions_enabled     = var.actions_enabled #"true"
  alarm_actions       = []
  ok_actions          = [var.sns_arn]
  dimensions = {
   InstanceId = var.InstanceId
   }
}