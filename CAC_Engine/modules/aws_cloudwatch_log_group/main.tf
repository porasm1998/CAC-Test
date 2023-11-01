
resource "aws_cloudwatch_log_group" "main" {
    
  name              = var.cloudwatch_log_name
  retention_in_days = var.retention_in_days
  tags              = var.tags

}

resource "aws_cloudwatch_log_stream" "stream" {
    
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.main.name 

}