variable "ami_id" {
  type = string
  description = "The AMI id of for the instance to be created"
}
variable "instance_type" {
  type = string
  description = "Type of Instance to be created"
}
variable "tagname" {
  type = string
  description = "Tagname for the EC2 instance"
}