variable "direct_connection_gateway" {
  type        = string
  description = "(Required) The name of the connection."
}

variable "amazon_side_asn" {
  type        = number
  description = "- (Required) The ASN to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294."
}