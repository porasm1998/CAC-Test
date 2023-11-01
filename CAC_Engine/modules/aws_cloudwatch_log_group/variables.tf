
variable "cloudwatch_log_name" {

  type        = string
  description = "(Optional, Forces new resource) The name of the log group. If omitted, Terraform will assign a random, unique name."

}
variable "log_stream_name" {

 type        = string 
 description = "(Required) The name of the log stream. Must not be longer than 512 characters and must not contain :"

}

variable "retention_in_days"{
   type        = string
   description = "(Optional) Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
   default     = 1
}

variable "tags" {
  
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."

}