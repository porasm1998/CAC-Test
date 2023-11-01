output "id" {
  value       = google_compute_ha_vpn_gateway.gateway.id
  description = "ID of the VPN gateway created"
}

output "self_link" {
  value       = google_compute_ha_vpn_gateway.gateway.self_link
  description = "URI of the VPN gateway"
}

output "vpn_interfaces_0_ip_address" {
  value       = google_compute_ha_vpn_gateway.gateway.vpn_interfaces[0].ip_address
  description = "External IP address for the VPN gateway interface"
}

output "vpn_interfaces_1_ip_address" {
  value       = google_compute_ha_vpn_gateway.gateway.vpn_interfaces[1].ip_address
  description = "External IP address for the VPN gateway interface"
}

output "vpn_interfaces_0" {
  value       = google_compute_ha_vpn_gateway.gateway.vpn_interfaces[0]
  description = "Interface on the VPN gateway"
}

output "vpn_interfaces_1" {
  value       = google_compute_ha_vpn_gateway.gateway.vpn_interfaces[1]
  description = "Interface on the VPN gateway"
}