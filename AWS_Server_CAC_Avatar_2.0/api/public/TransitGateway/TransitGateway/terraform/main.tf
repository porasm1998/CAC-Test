// this module will create AWS Transit gatway, 2 Transit gatway attachments,updating vpc route table with TGW 

module "tgw" {
  source                  = "./modules/terraform-aws-transit-gateway"
  vpc1                    = var.vpc1
  vpc2                    = var.vpc2
  vpc1_route_table_id     = var.vpc1_route_table_id
  vpc2_route_table_id     = var.vpc2_route_table_id
  destination_cidr_block1 = var.destination_cidr_block1
  destination_cidr_block2 = var.destination_cidr_block2
  vpc1_subnet_ids         = var.vpc1_subnet_ids
  vpc2_subnet_ids         = var.vpc2_subnet_ids
}