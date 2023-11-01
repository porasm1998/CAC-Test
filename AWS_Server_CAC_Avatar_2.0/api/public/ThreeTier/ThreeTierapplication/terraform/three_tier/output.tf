output "web_Server_1_arn" {
    value = aws_instance.web1.arn
}

output "web_Server_2_arn" {
    value = aws_instance.web2.arn
}

output "app_Server_1_arn" {
    value = aws_instance.app1.arn
}

output "app_Server_2_arn" {
    value = aws_instance.app2.arn
}

output "db_Server_1_arn" {
    value = aws_instance.db1.arn
}

output "db_Server_2_arn" {
    value = aws_instance.db2.arn
}

output "s3_ucket_arn" {
    value = aws_s3_bucket.main.arn
}