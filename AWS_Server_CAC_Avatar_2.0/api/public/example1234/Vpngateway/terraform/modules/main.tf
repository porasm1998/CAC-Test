/******************************************
  Create VPN gateway
 *****************************************/
resource "google_compute_ha_vpn_gateway" "gateway" {
  provider = google
  region   = var.region_name
  name     = var.gateway_name
  network  = var.network_name
  project  = var.project_id
}