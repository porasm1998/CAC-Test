output "id" {
  value       = module.infggty-euwe6-02.id
  description = "ID of the VPN gateway created"
}

output "self_link" {
  value       = module.infggty-euwe6-02.self_link
  description = "URI of the VPN gateway"
}

output "vpn_interfaces_0_ip_address" {
  value       = module.infggty-euwe6-02.vpn_interfaces_0_ip_address
  description = "External IP address for the VPN gateway interface"
}

output "vpn_interfaces_1_ip_address" {
  value       = module.infggty-euwe6-02.vpn_interfaces_1_ip_address
  description = "External IP address for the VPN gateway interface"
}

output "vpn_interfaces_0" {
  value       = module.infggty-euwe6-02.vpn_interfaces_0
  description = "Interface on the VPN gateway"
}

output "vpn_interfaces_1" {
  value       = module.infggty-euwe6-02.vpn_interfaces_1
  description = "Interface on the VPN gateway"
}