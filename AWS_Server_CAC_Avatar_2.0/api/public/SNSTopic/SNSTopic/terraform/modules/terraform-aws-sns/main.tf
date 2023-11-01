# Passing the sns_topic_name, sns_topic_display_name, sns_subscription_list to the Cloudformation template.
# This Terraform resource does not run anything but create the final form of the template that will be used in the aws_cloudformation_stack. 
data "template_file" "aws_cf_sns_stack" {
   template = file("${path.module}/templates/cf_aws_sns_email_stack.json.tpl")
   
   vars = {
   
     sns_topic_name        = var.sns_topic_name
     sns_display_name      = var.sns_topic_display_name
     sns_subscription_list = join(",", formatlist("{\"Endpoint\": \"%s\",\"Protocol\": \"%s\"}",
     var.sns_subscription_email_address_list,
     var.sns_subscription_protocol))
   }
 }

## Below resorce tell aws to run a CloudFormation template creating final resource and use the output of the template_file called rendered which provides the final rendered template.
resource "aws_cloudformation_stack" "tf_sns_topic" {
   name = var.stack_name
   template_body = data.template_file.aws_cf_sns_stack.rendered
   tags = {
     name = var.stack_name
   }
 }
 







