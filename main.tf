terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.61.0"
    }
  }
  required_version = ">= 1.2"

}

resource "aws_elasticache_cluster" "redis" {
  cluster_id               = var.cluster_id
  engine                   = var.engine
  engine_version           = var.engine_version
  node_type                = var.node_type
  num_cache_nodes          = var.num_cache_nodes
  parameter_group_name     = var.parameter_group_name
  port                     = var.port
  security_group_ids       = var.security_group_ids
  subnet_group_name        = aws_subnet.private.name
  tags                     = var.tags
  snapshot_retention_limit = var.snapshot_retention_limit
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = "10.202.196.0/23"
}




// locals {
//   all_subnets = merge({
//     "private"   = data.aws_subnet.private
//     }
//   )
// }
