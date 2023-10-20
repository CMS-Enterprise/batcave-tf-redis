
# Configure the AWS Provider
// provider "aws" {
//   region = "us-east-1"
// }




resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_id 
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  security_group_ids   = var.security_group_ids

  subnet_group_name = aws_elasticache_subnet_group.example.name


  tags = var.tags
}

// data "aws_subnet_ids" "private" {
//   vpc_id = var.vpc_id  # Specify the VPC ID where your existing subnets are located

//   # You can add additional filters here, e.g., based on tags, availability zone, etc.
//     filter {
//       name   = "tag:Name"
//       values = ["${var.project}-*-${var.env}-private-*"]
//     }
//   }

resource "aws_elasticache_subnet_group" "example" {
  name       = "my-cache-subnet"
  subnet_ids = [var.subnet_ids]
}


// locals {
//   all_subnets = merge({
//     "private"   = data.aws_subnet.private
//     }
//   )
// }








