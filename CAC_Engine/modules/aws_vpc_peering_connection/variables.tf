variable "vpc_id" {
  type        = string
  description = "(Required) The ID of the requester VPC."
}
variable "peer_vpc_id" {
  type        = string
  description = "(Required) The ID of the VPC with which you are creating the VPC Peering Connection."
}
variable "auto_accept" {
  type        = string
  description = "(Optional) Accept the peering (both VPCs need to be in the same AWS account and region)."
  default     = "false"
}
/* variable "allow_remote_vpc_dns_resolution_accepter" {
  type        = string
  description = "(Optional) - An optional configuration block that allows for VPC Peering Connection options to be set for the VPC that accepts the peering connection (a maximum of one)."
  default     = "false"
}
variable "allow_remote_vpc_dns_resolution_requester" {
  type        = string
  description = "(Optional) - A optional configuration block that allows for VPC Peering Connection options to be set for the VPC that requests the peering connection (a maximum of one)."
  default     = "false"
} */

variable "aws_region" {
  type        = string
  description = " (Optional) The region of the accepter VPC of the VPC Peering Connection. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side."
 
}
variable "peer_owner_id" {
  type        = string
  description = " (Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to."
 
}

