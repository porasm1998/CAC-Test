module "secretmanager" {
  source                     = "./modules/aws-secretsmanager"
  name                 = var.name

}