# batcave-tf-redis

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.61.0 |

## Modules

No modules.

## Resources
| Name | Type |
|------|------|
| [aws_secretsmanager_secret.redis_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.redis_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_elasticache_subnet_group.redis_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_elasticache_replication_group.redis_replication_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `cluster_id` | The identifier for the Redis cluster | `string` | n/a | yes |
| `cluster_description` | The description for the Redis cluster | `string` | n/a | yes |
| `node_type` | The compute and memory capacity of the nodes in the node group | `string` | n/a | yes |
| `num_cache_nodes` | The number of cache nodes in the cluster | `number` | `1` | no |
| `redis_secret_name` | The name of the AWS secret that will contain the Redis token | `string` | n/a | yes |
| `param_group_name` | The name of the parameter group to associate with this cache cluster | `string` | n/a | yes |
| `engine_version` | The version number of the cache engine to use for this cluster | `string` | n/a | yes |
| `port` | The port number on which each of the cache nodes will accept connections | `number` | `6379` | no |
| `subnet_group_name` | The name of the subnet group to be used for the cache cluster | `string` | n/a | yes |
| `subnet_ids` | A list of subnet IDs to add to the generated subnet group | `list(string)` | n/a | yes |
| `security_group_ids` | A list of security group IDs to associate with this cache cluster | `list(string)` | n/a | yes |
| `tags` | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `redis_replication_group_id` | The Redis replication group ID. This ID is used to identify the replication group in various operations with AWS ElastiCache. |
| `redis_replication_group_primary_endpoint` | The primary endpoint of the Redis replication group. This endpoint is used by applications to connect to the Redis cluster. |
| `redis_replication_group_port` | The port number on which each of the cache nodes accepts connections. This port is used alongside the primary endpoint to establish a connection to the cluster. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
