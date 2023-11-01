module "infggty-euwe6-02" {
  source       = "./modules/"
  gateway_name = var.gateway_name
  network_name = var.network_name
  region_name  = var.region_name
  project_id   = var.project_id
}
