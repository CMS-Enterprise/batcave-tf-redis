variable "vpc_id" {
  type = string
}

variable "cluster_id" {
  default = ""
  type    = string
}

variable "engine" {
  default = ""
  type    = string
}

variable "engine_version" {
  default = ""
  type    = string
}

variable "node_type" {
  type    = string
  default = "cache.m4.large"
}

variable "num_cache_nodes" {
  default = 1
  type    = number
}

variable "parameter_group_name" {
  default = ""
  type    = string
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "port" {
  default = 6379
  type    = number
}

// variable "subnet_lookup_overrides" {
//   description = "Some Subnets don't follow standard naming conventions.  Use this map to override the query used for looking up Subnets.  Ex: { private = \"foo-west-nonpublic-*\" }"
//   default     = {}
//   type        = map(string)
// }

variable "tags" {
  type = map(string)
  default = {
    Owner = "Batcave"
  }
}

variable "snapshot_retention_limit" {
  type        = number
  default     = 7
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted."
}
