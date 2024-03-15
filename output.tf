output "redis_replication_group_id" {
  description = "The Redis replication group ID"
  value       = aws_elasticache_replication_group.redis_replication_group.replication_group_id
}

output "redis_replication_group_primary_endpoint" {
  description = "The primary endpoint of the Redis replication group"
  value       = aws_elasticache_replication_group.redis_replication_group.primary_endpoint_address
}

output "redis_replication_group_port" {
  description = "The port number on which each of the cache nodes accepts connections"
  value       = aws_elasticache_replication_group.redis_replication_group.port
}
