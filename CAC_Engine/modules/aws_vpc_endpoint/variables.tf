
variable "vpc_id" {
  description = "(Required) The ID of the VPC in which the endpoint will be used."
  type        = string
}

variable "service_name" {
  description = "(Required) The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook)."
  type        = string
}

variable "vpc_endpoint_type" {
  description = "(Optional) The VPC endpoint type, Gateway, GatewayLoadBalancer, or Interface. Defaults to Gateway."
  type        = string
  default = "Gateway"
}

variable "private_dns_enabled" {
  description = "(Optional; AWS services and AWS Marketplace partner services only) Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Defaults to false."
  type        = string
  default = "false"
}

variable "tags" {
  
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."

}