terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.42.0"
    }
  }
  required_version = ">= 1.2"
}

# Generate a random password
resource "random_password" "redis_password" {
  length  = 16
  special = true
}

# Create a new secret in AWS Secrets Manager
resource "aws_secretsmanager_secret" "redis_secret" {
  name        = var.redis_secret_name
}

# Store the generated password in the secret
resource "aws_secretsmanager_secret_version" "redis_secret_version" {
  secret_id     = aws_secretsmanager_secret.redis_secret.id
  secret_string = random_password.redis_password.result
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "redis_replication_group" {
  replication_group_id       = var.cluster_id
  description                = var.cluster_description
  engine                     = "redis"
  engine_version             = var.engine_version
  node_type                  = var.node_type
  subnet_group_name          = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids         = var.security_group_ids
  parameter_group_name       = var.param_group_name
  apply_immediately          = true
  automatic_failover_enabled = false # Enable for multi-node clusters. This implicitly creates at least two nodes.
  auth_token                 = random_password.redis_password.result
  transit_encryption_enabled = true
  at_rest_encryption_enabled = true
  tags                       = var.tags
}

# Output to retrieve replication group's primary endpoint
output "redis_primary_endpoint_address" {
  value = aws_elasticache_replication_group.redis_replication_group.primary_endpoint_address
}
