variable "env" {
  default = "dev"
}

variable "project" {
  default = "eppe"
}

// variable "vpc_id" {}

variable "cluster_id" {
  default     = ""
  type        = string
}

variable "engine" {
  default     = ""
  type        = string
}

variable "engine_version" {
  default     = ""
  type        = string
}

variable "node_type" {
  default     = ""
  type        = string
}

variable "num_cache_nodes" {
  default     = 1
  type        = number
}

variable "parameter_group_name" {
  default     = ""
  type        = string
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "port" {
  default     = 6379
  type        = number
}

variable "subnet_ids" {
  type    = list(string)
  default = []
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