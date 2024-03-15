variable "cluster_id" {
  description = "The identifier for the Redis cluster"
  type        = string
}

variable "cluster_description" {
  description = "The description for the Redis cluster"
  type        = string
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes in the node group"
  type        = string
}

variable "num_cache_nodes" {
  description = "The number of cache nodes in the cluster"
  type        = number
}

variable "redis_secret_name" {
  description = "The name of the AWS secret that will contain the redis token"
  type        = string
}

variable "param_group_name" {
  description = "The name of the parameter group to associate with this cache cluster"
  type        = string
}

variable "engine_version" {
  description = "The version number of the cache engine to use for this cluster"
  type        = string
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections"
  type        = number
}

variable "subnet_group_name" {
  description = "The name of the subnet group to be used for the cache cluster"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to add to the generated subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with this cache cluster"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

